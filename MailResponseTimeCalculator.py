import win32com.client
import pandas
import datetime
import os
pandas.set_option('mode.chained_assignment', None)
# Step 0: Extract e-mail data and store in a pandas DataFrame called df
outlook = win32com.client.Dispatch('Outlook.Application').GetNamespace('MAPI')
namespace = outlook.Session
inbox = outlook.Folders('DMO Material Requests')
df = pandas.DataFrame()
df2 = pandas.DataFrame()
emps = ['Claudiu Catargiu', 'Marius Savu', 'Bogdan Dragan', 'Arabella Stan', 'Razvan Florian',
        'Razvan Rusescu', 'Valentin Vulpe', 'Irina Jiga', 'Cezara Neagu', 'Catalin Paltanea',
        'Edmond-Gabriel Ronțu', 'Gabriel Secu']
sender = []
subject = []
convoID = []
so = []
box = []
dmo_sender = []
for subfolder in inbox.Folders:
    if subfolder.Name[0].isdigit() or subfolder.Name[0] == '!':
            messages = subfolder.Items
            for m in messages:
                sender.append(m.SenderName)
                subject.append(m.Subject)
                so.append(str(m.SentOn))
                if m.SenderName == 'DMO Material Requests':
                    contor = 0
                    for e in emps:
                        if e in m.Body:
                            dmo_sender.append(e.split()[1] + ', ' + e.split()[0])
                            break
                        else:
                            contor += 1
                            if contor == len(emps):
                                dmo_sender.append('No sender found')
                                break
                            else:
                                continue
                else:
                    dmo_sender.append(None)

                convoID.append(m.ConversationID)
                box.append(subfolder.Name)
df = pandas.DataFrame({'Sender': sender, 'Subject': subject,
                       'ConversationID': convoID, 'SentOn': so,
                       'MailBox': box, 'DMO_Sender': dmo_sender})
# Step 1: Edit df by converting column types, sort ascending by SentOn date, descending by ConversationID
# and resetting the index

df['SentOn'] = df['SentOn'].str.strip('+00:00')
df['SentOn'] = pandas.to_datetime(df['SentOn'])
df = df.sort_values(['ConversationID', 'SentOn'], ascending=(False, True))
df.reset_index(inplace=True)
df.drop(columns='index', inplace=True)
# Step 2: Create separate data frame of unique conversation IDs called dcid (distinct conversation id)

df2 = pandas.DataFrame()
dcid = pandas.DataFrame({'DCID': []})
dcid['DCID'] = df['ConversationID'].unique()

# Step 3: Loop through each distinct conversation id, create a temporary dataframe where
# the e-mail response time is calculated and return the response time in the original dataframe

for i in dcid.iterrows():
    tempdf = df[df['ConversationID'] == i[1]['DCID']]
    tempdf['Response_Time'] = tempdf['SentOn'].diff()
    df2 = df2.append(tempdf)
df2 = df2['Response_Time']
df = df.merge(df2.to_frame(), how='left', left_index=True, right_index=True)
df['Response_Time_days'] = df['Response_Time'].dt.days
df['SentOn_Month'] = df['SentOn'].dt.month_name()
df['SentOn_Year'] = df['SentOn'].dt.year.astype(str)
df.to_excel(os.getcwd()+'\\email_report.xlsx',index=False)
