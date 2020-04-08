import win32com.client
import pandas
import datetime
from numpy import timedelta64 as td
from tkinter import *
from tkinter import filedialog
from tkinter import messagebox
pandas.set_option('mode.chained_assignment', None)

class EmailSLACalculator:

    def __init__(self):
        self.dmo_material_requests = {'GBSWO66': 'Catalin Paltanea', 'GBSIM63': 'Irina Jiga', 'GBSJU13': 'Claudiu Catargiu',
                    'GBSQT20': 'Cezara Stefania Neagu', 'GBSYX05': 'Arabella Stan', 'GBSCU37': 'Valentin Vulpe',
                    'GBSKL00': 'Bogdan Dragan', 'GBSVO78': 'Razvan Rusescu',
                    'GBSKH61': 'Razvan-Alexandru Florian', 'GBSXO59': 'Rontu Edmond', 'GBSJY49': 'Secu Gabriel',
                    'GBSKS95': 'Marius Savu'}
        self.mduk = {}
        self.scmdt = {}
        self.mboxes = {'DMO Material Requests': self.dmo_material_requests,
                       'masterdata.uk': self.mduk,
                       'Supply Chain Master Data Team': self.scmdt}
        gui = Tk()
        fontMC = ("Century Gothic", 10)
        gui.title('E-mail SLA Calculator v1')
        gui.iconbitmap('MCico.ico')
        gui.configure(background='white')

        # Row 1
        # Row 1 - Select label
        where_label = Label(gui, text='Output folder:', font=fontMC,
                            wraplength=150, bg='white').grid(row=1, column=1)
        # Row 1 - Entry box
        self.where_val = StringVar()
        self.where_entry = Entry(gui, textvariable=self.where_val, relief='solid', width=67)
        self.where_entry.grid(row=1, column=3, columnspan=6, sticky=W)
        # Row 1 - Browse button
        where_btn = Button(gui, text='Browse', command=self.browse)
        where_btn.config(font=fontMC, relief='solid', borderwidth=1)
        where_btn.grid(row=1, column=9)

        # Row 3 - Mailbox Dropdown

        mb_label = Label(gui, text='MailBox:', font=fontMC, bg='white').grid(row=3, column=1)
        self.mbox = StringVar(gui)
        self.mbox_menu = OptionMenu(gui, self.mbox, *self.mboxes.keys())
        self.mbox_menu.grid(row=3, column=3, sticky=W)
        self.mbox.trace('w', self.change_dropdown)

        # Row 5 - DateFilters
        start_date_label = Label(gui, text='Start date (dd.mm.yyyy):', font=fontMC, bg='white').grid(row=5, column=3,
                                                                                                     sticky=E)
        self.start_date_entry = Entry(gui, relief='solid', width=10)
        self.start_date_entry.grid(row=5, column=5, sticky=W)
        end_date_label = Label(gui, text='End date (dd.mm.yyyy):', font=fontMC, bg='white').grid(row=5, column=7,
                                                                                                 sticky=E)
        self.end_date_entry = Entry(gui, relief='solid', width=10)
        self.end_date_entry.grid(row=5, column=9)

        # Run program - row 5
        run_btn = Button(gui, text='Extract Report', command=self.extract_mails)
        run_btn.config(font=fontMC, relief='solid', borderwidth=1, fg='Red')
        run_btn.grid(row=7, column=3, columnspan=4, ipadx=67, sticky=W)

        for i in range(12):
            if i % 2 == 0:
                gui.grid_rowconfigure(index=i, minsize='10')

        for i in range(12):
            if i % 2 == 0:
                gui.grid_columnconfigure(index=i, minsize='5')

        gui.mainloop()

    def extract_mails(self):

        # Step 0: Extract e-mail data and store in a pandas DataFrame called df

        outlook = win32com.client.Dispatch('Outlook.Application').GetNamespace('MAPI')
        inbox_name = self.mbox.get()
        inbox = outlook.Folders(inbox_name)
        sender = []
        subject = []
        convoID = []
        so = []
        box = []
        generic_sender = []
        start_date = datetime.datetime.strptime(self.start_date_entry.get(), '%d.%m.%Y')
        start_date = datetime.datetime.strftime(start_date, '%x')
        end_date = datetime.datetime.strptime(self.end_date_entry.get(), '%d.%m.%Y')
        end_date = datetime.datetime.strftime(end_date, '%x')
        for subfolder in inbox.Folders:
            try:
                if subfolder.Name[0].isdigit() or subfolder.Name[0] == '!':
                    self.time_filter = "[SentOn]>='{0}' AND [SentOn]<='{1}'".format(start_date, end_date)
                    messages = subfolder.Items.Restrict(self.time_filter)
                    for m in messages:
                        sender.append(m.SenderName)
                        subject.append(m.Subject)
                        so.append(str(m.SentOn))
                        if m.SenderName == self.mbox.get():
                            contor = 0
                            for e in self.mbox_filter.keys():
                                if e in m.Body:
                                    generic_sender.append(self.mbox_filter[e].split()[1] + ', ' +
                                                      self.mbox_filter[e].split()[0])
                                    break
                                else:
                                    contor += 1
                                    if contor == len(self.mbox_filter):
                                        generic_sender.append('No sender found')
                                        break
                                    else:
                                        continue
                        else:
                            generic_sender.append(None)
                        convoID.append(m.ConversationID)
                        box.append(subfolder.Name)
                self.df = pandas.DataFrame({'Sender': sender, 'Subject': subject,
                                   'ConversationID': convoID, 'SentOn': so,
                                   'MailBox': box, 'DMO_Sender': generic_sender})
            except Exception as e:
                messagebox.showinfo(title='Eroare', message=str(e))

        # Step 1: Edit df by converting column types, sort ascending by SentOn date, descending by ConversationID
        # and resetting the index
        if len(self.df) != 0:
            self.df['SentOn'] = self.df['SentOn'].str.strip('+00:00')
            self.df['SentOn'] = pandas.to_datetime(self.df['SentOn'])
            self.df = self.df.sort_values(['ConversationID', 'SentOn'], ascending=(False, True))
            self.df.reset_index(inplace=True)
            self.df.drop(columns='index', inplace=True)

            # Step 2: Create separate data frame of unique conversation IDs called dcid (distinct conversation id)

            self.df2 = pandas.DataFrame()
            self.dcid = pandas.DataFrame({'DCID': []})
            self.dcid['DCID'] = self.df['ConversationID'].unique()

            # Step 3: Loop through each distinct conversation id, create a temporary dataframe where
            # the e-mail response time is calculated and return the response time in the original dataframe

            for i in self.dcid.iterrows():
                tempdf = self.df[self.df['ConversationID'] == i[1]['DCID']]
                tempdf['Response_Time'] = tempdf['SentOn'].diff()
                self.df2 = self.df2.append(tempdf)
            self.df2 = self.df2['Response_Time']
            self.df = self.df.merge(self.df2.to_frame(), how='left', left_index=True, right_index=True)
            self.df['Response_Time_h'] = self.df['Response_Time'] / td(1, 'h')
            self.df['Response_Time_days'] = self.df['Response_Time'] / td(1, 'D')
            self.df.drop(columns=['Response_Time'], inplace=True)
            self.df['SentOn_day'] = self.df['SentOn'].dt.day_name()
            self.df['SentOn_Month'] = self.df['SentOn'].dt.month_name()
            self.df['SentOn_Year'] = self.df['SentOn'].dt.year.astype(str)
            self.total_response_time = self.df.groupby(['ConversationID'], as_index=False)[['Response_Time_h',
                                                                                            'Response_Time_days']].sum()
            self.total_response_time.rename(columns={'Response_Time_h': 'Total_Response_Time_h',
                                                'Response_Time_days': 'Total_Response_Time_days'}, inplace=True)
            self.unique_conversationIDs = self.df['ConversationID'].drop_duplicates().to_frame()
            nameval_start = datetime.datetime.strptime(self.start_date_entry.get(), '%d.%m.%Y')
            nameval_end = datetime.datetime.strptime(self.end_date_entry.get(), '%d.%m.%Y')
            nameval_start = datetime.date.strftime(nameval_start,'%d %b %Y')
            nameval_end = datetime.date.strftime(nameval_end,'%d %b %Y')
            writer = pandas.ExcelWriter(self.where_entry.get() +
                                        '/E-mail SLA calculator {0} - from {1} to {2}.xlsx'.format(inbox_name,
                                                                                                    nameval_start,
                                                                                                    nameval_end),
                                        engine='xlsxwriter')

            with writer:
                self.df.to_excel(writer, index=False, sheet_name='Raw Data')
                self.total_response_time.to_excel(writer, index=False, sheet_name='Response Time summary')
                self.unique_conversationIDs.to_excel(writer, index=False, sheet_name='Unique Conversation IDs')
            messagebox.showinfo(title='Data extraction succesful',
                                message='Report Extracted!\nPath to file:\n{0} '.format(self.where_entry.get() +
                                        '/E-mail SLA calculator {0} - from {1} to {2}.xlsx'.format(inbox_name,
                                                                                                    nameval_start,
                                                                                                    nameval_end)))
        else:
            messagebox.showinfo(title='Ooops',
                                message='No e-mails in the selected period\nPlease try using a different time filter.')

    def browse(self):
        self.selected_file = filedialog.askdirectory()
        self.where_val.set(self.selected_file)

    def change_dropdown(self, *args):
        self.mbox_filter = self.mboxes[str(self.mbox.get())]

if __name__ == '__main__':
    test = EmailSLACalculator()