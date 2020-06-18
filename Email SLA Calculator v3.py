import win32com.client
import pandas
import datetime
from numpy import timedelta64 as td
from tkinter import *
from tkinter import filedialog
from tkinter import messagebox
import sqlite3
import os
pandas.set_option('mode.chained_assignment', None)
import win32timezone

# HIDDEN MODULE TO COMPILE TO EXE: win32timezone


class EmailSLACalculator:

    def __init__(self):
        os.chdir(r'C:\Python Projects\Molson Coors\Email SLA Calculator')
        # --- Email addresses and their characteristics

        self.conn = sqlite3.connect('email_sla_calculator.sql')
        self.c = self.conn.cursor()
        self.c.execute('select mailbox from mailboxes order by mailbox')
        self.adrese = [mailbox[0] for mailbox in self.c.fetchall()]

        # --- Gui properties

        gui = Tk()
        gui.lift()
        self.fontMC = ("Century Gothic", 10)
        gui.title('E-mail SLA Calculator v3')
        gui.iconbitmap('MCico.ico')
        gui.configure(background='white')

        # --- Labels

        where_label = Label(gui, text='Output folder:', font=self.fontMC,
                            wraplength=150, bg='white').grid(row=1, column=1)
        mb_label = Label(gui, text='MailBox:', font=self.fontMC, bg='white').grid(row=3, column=1)
        start_date_label = Label(gui, text='Start date (dd.mm.yyyy):', font=self.fontMC, bg='white').grid(row=5, column=3,
                                                                                                     sticky=W)
        end_date_label = Label(gui, text='End date (dd.mm.yyyy):', font=self.fontMC, bg='white').grid(row=5, column=7,
                                                                                                 sticky=E)
        employees_label = Label(gui, text='Mapped Employees', font=self.fontMC, bg='white').grid(row=10, column=3,
                                                                                            columnspan=3, sticky=W)

        # --- Entries

        # ---- Excel Report Destionation

        self.where_val = StringVar()
        self.where_entry = Entry(gui, textvariable=self.where_val, relief='solid', width=67)
        self.where_entry.grid(row=1, column=3, columnspan=5, sticky=W)

        # ---- Start date in Date Filter

        self.start_date_entry = Entry(gui, relief='solid', width=10)
        self.start_date_entry.grid(row=5, column=4, sticky=W)

        # --- End date in Date Filter

        self.end_date_entry = Entry(gui, relief='solid', width=10)
        self.end_date_entry.grid(row=5, column=8, sticky=W)

        # --- Dropdown

        self.mbox = StringVar(gui)
        self.mbox_menu = OptionMenu(gui, self.mbox, *self.adrese)
        self.mbox_menu.grid(row=3, column=3, sticky=W)
        self.mbox.trace('w', self.change_dropdown)

        # --- Listbox (employee list)

        self.listbox = Listbox(gui, bg='white', height=10, width=12, relief='solid', font=self.fontMC,
                               selectmode=EXTENDED)
        self.listbox.grid(row=11, column=3, columnspan=3, ipadx=67, rowspan=5, sticky=W)

        # --- Buttons

        # ---- Browse button

        where_btn = Button(gui, text='Browse', command=self.browse)
        where_btn.config(font=self.fontMC, relief='solid', borderwidth=1)
        where_btn.grid(row=1, column=8)

        # ---- Extract report button

        run_btn = Button(gui, text='Extract Report', command=self.extract_mails)
        run_btn.config(font=self.fontMC, relief='solid', borderwidth=1, fg='Red')
        run_btn.grid(row=7, column=3, columnspan=2, sticky=W)

        # --- Delete user button

        delete_btn = Button(gui, text='Delete selected employee', command=self.delete_selected_user)
        delete_btn.config(font=self.fontMC, relief='solid', borderwidth=1)
        delete_btn.grid(row=11, column=7, sticky=W)

        # --- Add user button

        add_btn = Button(gui, text='Add new employee', command=self.add_user)
        add_btn.config(font=self.fontMC, relief='solid', borderwidth=1)
        add_btn.grid(row=12, column=7, sticky=W)


        # --- Final GUI config: Setting blank row and column sizes

        for i in range(19):
            if i % 2 == 0:
                gui.grid_rowconfigure(index=i, minsize='10')

        for i in range(12):
            if i % 2 == 0:
                gui.grid_columnconfigure(index=i, minsize='5')

        # ---

        gui.mainloop()

    def extract_mails(self):

        # --- Step 0: Extract e-mail data and store in a pandas DataFrame called df

        outlook = win32com.client.Dispatch('Outlook.Application').GetNamespace('MAPI')
        self.inbox_name = self.mbox.get()

        self.c.execute('select id from mailboxes where mailbox ="{}"'.format(self.inbox_name))
        inbox_id = self.c.fetchall()[0][0]
        try:
            inbox = outlook.GetFolderFromID(inbox_id)
        except Exception as e:
            messagebox.showinfo(title='Outlook error', message=str(e))

        self.c.execute('select tower from mailboxes where mailbox ="{}"'.format(self.inbox_name))
        tower = self.c.fetchall()[0][0]

        self.c.execute('select sender_id from mailboxes where mailbox="{}"'.format(self.inbox_name))
        self.sender_id = self.c.fetchall()[0][0]

        self.c.execute('select code from employees where mailbox="{}"'.format(self.mbox.get()))
        self.coduri_angajati = [i[0] for i in self.c.fetchall()]


        # Timestamp conversion to system preferences

        start_date = datetime.datetime.strptime(self.start_date_entry.get(), '%d.%m.%Y')
        start_date = datetime.datetime.strftime(start_date, '%x')
        end_date = datetime.datetime.strptime(self.end_date_entry.get(), '%d.%m.%Y')
        end_date = datetime.datetime.strftime(end_date, '%x')
        self.time_filter = "[SentOn]>='{0}' AND [SentOn]<='{1}'".format(start_date, end_date)

        # Mailbox criteria filter

        # --- Data Extraction Algorithm

        if self.inbox_name == 'DMO Material Requests':
            root_folder = inbox
            self.df = self.extraction_algo(tower='MD', root_folder=root_folder)
        elif self.inbox_name == 'Supply Chain Master Data Team':
            root_folder = inbox.Folders('Inbox').Folders('2_Completed_tasks')
            self.df = self.extraction_algo(tower='MD', root_folder=root_folder)
        elif self.inbox_name == 'MasterData UK':
            root_folder = inbox.Folders('Inbox')
            self.df = self.extraction_algo(tower='MD', root_folder=root_folder)
        elif tower == 'PTP':
            root_folder = inbox
            self.df = self.extraction_algo(tower='PTP', root_folder=root_folder)
        elif tower == 'HR':
            root_folder = inbox
            self.df = self.extraction_algo(tower='HR', root_folder=root_folder)

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
                                        '/E-mail SLA calculator {0} - from {1} to {2}.xlsx'.format(self.inbox_name,
                                                                                                    nameval_start,
                                                                                                    nameval_end),
                                        engine='xlsxwriter')
            with writer:
                self.df.to_excel(writer, index=False, sheet_name='Raw Data')
                self.total_response_time.to_excel(writer, index=False, sheet_name='Response Time summary')
                self.unique_conversationIDs.to_excel(writer, index=False, sheet_name='Unique Conversation IDs')
            messagebox.showinfo(title='Data extraction succesful',
                                message='Report Extracted!\nPath to file:\n{0} '.format(self.where_entry.get() +
                                        '/E-mail SLA calculator {0} - from {1} to {2}.xlsx'.format(self.inbox_name,
                                                                                                    nameval_start,
                                                                                                    nameval_end)))
        else:
            messagebox.showinfo(title='Ooops',
                                message='No e-mails in the selected period\nPlease try using a different time filter.')

    def browse(self):
        self.selected_file = filedialog.askdirectory()
        self.where_val.set(self.selected_file)

    def change_dropdown(self, *args):
        self.mbox_filter = self.mbox.get()
        self.refresh_listbox()

    def delete_selected_user(self):
        del_emp = self.listbox.get(ANCHOR)
        result = messagebox.askquestion('Confirm Employee Deletion', icon='warning', type='yesnocancel',
                                        message='You are about to delete {} from the employees mapped on this mailbox.'
                                                '\n'
                                                'Are you sure you want to delete this employee?'.format(del_emp))
        if result == 'yes':
            self.c.execute(
                '''DELETE FROM employees WHERE employee = "{}" AND mailbox = "{}"'''.format(del_emp, self.mbox_filter)
            )
            self.conn.commit()
            messagebox.showinfo(title='Deletion Complete',
                                message='{} has been deleted from the employees mapped on {}'.format(del_emp,
                                                                                                     self.mbox_filter))
            self.refresh_listbox()
        else:
            pass

    def add_user(self):
        self.new_user_window = Toplevel()
        self.new_user_window.lift()
        self.new_user_window.iconbitmap('MCico.ico')
        self.new_user_window.configure(background='white')
        name_lbl = Label(self.new_user_window, text="New employee's name:", font=self.fontMC, bg='white').grid(row=1, column=1, sticky='ew')
        code_lbl = Label(self.new_user_window, text="New employee's code:", font=self.fontMC, bg='white').grid(row=2, column=1, sticky='ew')
        mailbox_lbl = Label(self.new_user_window, text="Mailbox:", font=self.fontMC, bg='white').grid(row=3, column=1, sticky='ew')

        # --- Entries

        self.name_entry = Entry(self.new_user_window, relief='solid', width=30)
        self.name_entry.grid(row=1, column=2)
        self.code_entry = Entry(self.new_user_window, relief='solid', width=30)
        self.code_entry.grid(row=2, column=2)

        # --- Mailboxes Dropdown

        self.mbox1 = StringVar(self.new_user_window)
        self.mbox_menu = OptionMenu(self.new_user_window, self.mbox1, *self.adrese)
        self.mbox_menu.grid(row=3, column=2, sticky='ew')

        # --- Add Button

        add_btn = Button(self.new_user_window, text='Add employee to database', command=self.add_emp)
        add_btn.grid(row=4, column=1, columnspan=2)
        
    def refresh_listbox(self):
        self.c.execute('select employee from employees where mailbox="{}"'.format(self.mbox.get()))
        self.employees = [i[0] for i in self.c.fetchall()]
        self.listbox.delete(0, 'end')
        for employee in self.employees:
            self.listbox.insert(END, employee)
            
    def add_emp(self):

        if self.name_entry.get() != '' and self.code_entry.get() != '' and self.mbox1.get() != '':
            answer = messagebox.askquestion(title='Before addition', type='yesnocancel',
                                            message='Are you sure you want to add employee <{}> - code <{}> - '
                                                    'mailbox <{}> - ?'.format(self.name_entry.get(),
                                                                              self.code_entry.get(),
                                                                              self.mbox1.get())
                                            )
            if answer == 'yes':
                self.c.execute('''INSERT INTO employees VALUES ("{0}","{1}", "{2}")'''.format(self.name_entry.get(),
                                                                                              self.code_entry.get(),
                                                                                              self.mbox1.get()))
                self.conn.commit()
                self.refresh_listbox()
                messagebox.showinfo(title='Yey', message='Done :)')
            else:
                pass
        else:
            messagebox.showinfo(title='oops!', message='some info is missing. try again')

    def extraction_func(self, outlook_folder, filtru_timp, sender_id, coduri_angajati):
        messages = outlook_folder.Items.Restrict(filtru_timp)
        sender = []
        subject = []
        convoID = []
        so = []
        box = []
        generic_sender = []

        if messages.count > 0:
            for m in messages:
                try:
                    sender.append(m.SenderName)
                except:
                    sender.append('Error extracting sender name')
                try:
                    subject.append(m.Subject)
                except:
                    subject.append('Error extracting subject')
                try:
                    so.append(str(m.SentOn))
                except:
                    so.append('1900-01-01 00:00:00+00')
                if sender_id.upper() in m.SenderEmailAddress.upper():
                    contor = 0
                    for e in coduri_angajati:
                        if e in m.Body:
                            try:
                                self.c.execute('select employee from employees where code = "{}" and mailbox= "{}"'
                                               .format(e, self.mbox.get()))
                                nume_angajat = self.c.fetchall()[0][0]
                                generic_sender.append(nume_angajat.split()[1] + ', ' +
                                                      nume_angajat.split()[0])
                                break
                            except:
                                generic_sender.append('Error extracting generic sender')
                        else:
                            contor += 1
                            if contor == len(coduri_angajati):
                                generic_sender.append('No sender found')
                                break
                            else:
                                continue
                else:
                    generic_sender.append(None)

                try:
                    convoID.append(m.ConversationID)
                except:
                    convoID.append('Error extracting conversation ID')
                try:
                    box.append(outlook_folder.Name)
                except:
                    box.append('Error extracting outlook folder name')

        dfef = pandas.DataFrame({'Sender': sender, 'Subject': subject, 'ConversationID': convoID, 'SentOn': so,
                               'MailBox': box, 'Original_sender': generic_sender})
        return dfef

    def extraction_algo(self, tower, root_folder):
        dfea = pandas.DataFrame()
        if tower == 'MD':
            target_folders = [i.Name for i in root_folder.Folders if i.Name[0].isdigit() or i.Name[0] == '!']
        elif tower == 'PTP':
            target_folders = ['Sent Items', 'Inbox']
        elif tower == 'HR':
            if self.inbox_name[-3:] == 'MNE':
                target_folders = ['Sent Items', 'Inbox', 'Zahtevi iz PC', 'Odmori ', 'Milanka', 'Done',
                                  'Arhiva->New Hire', 'Arhiva->Promotion_Lateral Move_Demotion', 'Arhiva->Rehire ',
                                  'Arhiva->Resenja Potpisana']
            elif self.inbox_name[-3:] == 'SRB':
                target_folders = ['Sent Items', 'Inbox', 'Zahtevi iz PC', 'TA INFO', 'Stalled Workflow Request',
                                  'Milanka', 'Done ', 'Arhiva->Doznake za Bolovanje',
                                  'Arhiva->Email za Contract End Date', 'Arhiva->Godišnji odmor- rešenja',
                                  'Arhiva->Izvestaji o probnom radu ', 'Arhiva->Job Change', 'Arhiva->New Hire',
                                  'Arhiva->OFFER APPROVALS TA', 'Arhiva->Out Of Cycle', 'Arhiva->Rehire',
                                  'Arhiva->Resenja Plaćena Potpisana', 'Arhiva->Termination', 'Arhiva->Unapredjenje ']
        for i in target_folders:
            if '->' in i:
                try:
                    subfolder = root_folder.Folders(i.split('->')[0]).Folders(i.split('->')[1])
                except:
                    messagebox.showinfo(title='Error', message='Could not connect to folder {}'.format(i))
                    continue
            else:
                try:
                    subfolder = root_folder.Folders(i)
                except:
                    messagebox.showinfo(title='Error', message='Could not connect to folder {}'.format(i))
                    continue
            try:
                dfea = dfea.append(self.extraction_func(outlook_folder=subfolder, filtru_timp=self.time_filter,
                                                        sender_id=self.sender_id, coduri_angajati=self.coduri_angajati))
            except Exception as e:
                messagebox.showinfo(title='Error', message=str(e))
                continue
        return dfea


if __name__ == '__main__':
    test = EmailSLACalculator()