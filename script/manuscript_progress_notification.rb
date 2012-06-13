#!/usr/bin/env ruby

require 'net/smtp'
require 'pg'

#########################################
# manuscript_progress_notification.rb
# Ruby code 419 lines
# Written by Heping Zheng on 22-Dec-2011
# For the automatic generation of Email notifications from manuscript preparation database
#
message = ''
def mail_header(firstname,lastname,email,current_time,boundary)
  message = "From: Manuscript Preparation Database <manuscript-db@iwonka.med.virginia.edu>\n"
  message+= 'To: '+firstname+' '+lastname+' <'+email+">\n"
  message+= "Date: "+current_time+"\n"
  message+= <<MESSAGE
Subject: Manuscripts that need your attention for the incoming week (Do not reply)
MIME-Version: 1.0
Content-Type: text/html; charset="us-ascii"
MESSAGE
  message+= "\n\n<html><body>Dear Dr. "+lastname.capitalize+",<br>\n<br>\n"
  return message
end

def mail_open_sentence(last_update,is_wladek)
  if (last_update<=7)
    return "  Thanks for all the quality work during the past week.<br>\n"
  elsif (last_update>30)
    message=" Was there any progress on manuscripts "
    if (is_wladek)
      message+="preparation at all?"
    else
      message+="recently?"
    end
    message+=" We haven't heard from you for an entire month."
    return message+"<br>\n"
  else
    return "  Was there any progress on manuscripts during the past week? We appreciate if you could spend a little more time to avoid facing exactly the same report next week.<br>\n"
  end
end

def mail_link(link)
  message="<a href=\""+link+"\">"+link+"</a>"
  return message
end

def mail_signature(frequency_str,next_date,is_wladek,boundary)
message = "<br>\n  If you find any discrepancies between the present report and your work in progress, please update the manuscript preparation database accordingly. ("+mail_link('http://zenobi-vpn/milapa/')+")<br>\n"
message += "<br>\n  You are currently receiving manuscript progress reports "+frequency_str+". Next report will be delivered to your Email on "+next_date
message += ". <br>\n";
# message += ". Please follow the link below if you would like to manage your settings or turn off these reminders.<br>\n"
# message += "("+mail_link('http://zenobi-vpn/admin/papers/notification/')+")<br>\n<br>\n"
# message += "  If you do not wish to be reminded during vacation or a temporary absence, you are encouraged to consider turning off E-mail notification temporarily by registering a vacation plan. ("+mail_link('http://zenobi-vpn/admin/papers/absence/add/')+") <br>\n"
if (is_wladek)
  message += "<br>\nappreciate your effort resolving all ready-to-go manuscripts in a timely manner,<br>\n"
else
  message += "<br>\nappreciate your effort keeping the information in manuscript preparation database up to date,<br>\n"
end
message += <<MESSAGE3
best regards,<br>
Manuscript preparation database<br>
http://zenobi-vpn/milapa/<br>
http://10.8.1.88/milapa/<br>
Technical Support Team:<br>
<a href="mailto:dust@iwonka.med.virginia.edu">Heping Zheng</a>, <a href="mailto:matt_d@iwonka.med.virginia.edu">Matt Demas</a><br>
</body>
</html>
MESSAGE3
message += "\n"
return message 
end

def check_update(last_update,strrec)
  last_update=365
  if(Integer(strrec)<last_update)
    last_update=Integer(strrec)
  end
  return last_update
end

def number_text(num)
  if(num>10)
    return String(num)
  elsif(num==10)
    return "ten"
  elsif(num==9)
    return "nine"
  elsif(num==8)
    return "eight"
  elsif(num==7)
    return "seven"
  elsif(num==6)
    return "six"
  elsif(num==5)
    return "five"
  elsif(num==4)
    return "four"
  elsif(num==3)
    return "three"
  elsif(num==2)
    return "two"
  elsif(num==1)
    return "one"
  elsif(num==0)
    return "zero"
  elsif(num<0)
    return String(num)
  end
end

def for_journal(rec)
  return " for journal <a href=\""+rec['url']+"\">"+rec['journal_abbr']+"</a>"
end

def body_wladek_task(rd)
  message=""
  rd.each do |rec|
    message += "<br>\n  "+rec['topic']+" manuscript by "+rec['firstname']+" "+rec['lastname']+" is waiting for you to "+rec['description']
  end
  if(rd.count>=1)
    message += "<br>\n"
  end
  return message
end

def body_wladek_submit(sd,sm,rd,num_others)
  message=""
  if(sd.count>=1)
    pastdue_count=0
    deadline_count=0
    sd.each do |rec|
      if(Integer(rec['days_left'])>=0)
        deadline_count+=1
      elsif(Integer(rec['days_left'])<0)
        pastdue_count+=1
      end
    end
    if(pastdue_count>=1)
      sd.each do |rec|
        if(Integer(rec['days_left'])<0)
          message+="<br>\n  <b>[URGENT]</b> You manuscript "+rec['topic']+for_journal(rec)+" is now <b>pastdue</b> for "+number_text(Integer(rec['days_left']).abs)+" days, please submit it as soon as possible."
        end
      end
      message+="<br>\n"
    end
    if(deadline_count>=1)
      if(deadline_count==1)
        message+="<br>\n  You have one manuscript submission deadline approaching:"
      else
        message+="<br>\n  You have several manuscript submission deadlines approaching:"
      end
      sd.each do |rec|
        if(Integer(rec['days_left'])>1)
          message+="<br>\n  "+rec['topic']+for_journal(rec)+" needs to be submitted within the next "+number_text(Integer(rec['days_left']))+" days before the submission deadline."
        elsif(Integer(rec['days_left'])==1)
          message+="<br>\n  "+rec['topic']+for_journal(rec)+" needs to be submitted TOMORROW."
        elsif(Integer(rec['days_left'])==0)
          message+="<br>\n  <b>[URGENT]</b> "+rec['topic']+" manuscript"+for_journal(rec)+" needs to be submitted <b>TODAY</b>."
        end
      end
      message+="<br>\n"
    end
  end

  if(sm.count>=1)
    message+="<br>\n  In addition, you have "
    if(sm.count==1)
      message+="one manuscript that is ready for submission but you haven't submitted it yet"
    else
      message+="several manuscripts that are ready for submission but you haven't submitted them yet"
    end
    i=0
    sm.each do |rec|
      i+=1
      message+="<br>\n"+String(i)+". "+rec['topic']+" manuscript prepared by "+rec['firstname']+" "+rec['lastname']+for_journal(rec)
      if(Integer(rec['days_inactive']) > 7)
        message+=" was ready since "+number_text(Integer(rec['days_inactive']))+" days ago but no submission was reported"
      else
        message+=" becomes ready for submission within the past week"
      end
    end
    message+="<br>\n"
  end

  message+=body_wladek_task(rd)
  if(num_others>=1) 
    message+="<br>\n  There are "+number_text(num_others)+' other manuscripts that are waiting for your input. After you finish submitting all these read-to-submit manuscripts, the manuscript preparation database will also remind you about these other manuscripts that are waiting for your response. Please look into manuscript preparation database for more details: (http://zenobi-vpn/milapa/)'
    message+="<br>\n"
  end
  return message
end

def body_wladek_comment(rd,rs)
  message=body_wladek_task(rd)
  if(rs.count>=1)
    if(rs.count==1)
      message+="<br>\n  There is another manuscript that awaits your input."
    else
      messsage+="<br>\n  There are "+rs.count+" other manuscripts that await your input, including:"
    end
    i=0
    rs.each do |rec|
      i+=1
      message+="<br>\n"+String(i)+". "+rec['topic']+" by "+rec['firstname']+" "+rec['lastname']
    end
    mesage+="<br>\nPlease respond accordingly if you are expecting further progress in these projects\n"
  end
  return message
end

def body_heping_manuscript(topic,priority)
  message="the "+topic+" manuscript that "
  if(priority==0)
    message+="is waiting for Wladek to submit"
  elsif(priority==1)
    message+="is waiting for Wladek's response"
  elsif(priority==2)
    message+="is still under preparation"
  elsif(priority==3)
    message+="is waiting for special instruction"
  elsif(priority==4)
    message+="has been submitted and awaits a decision from the editorial office"
  else
    message+="has an unknown status, please make sure the status is correct in the manuscript database"
  end
  return message
end

def body_heping_report(report)
  message=""
  if(report.count>=1)
    if(report.count==1)
      message+="<br>\n  You have one active manuscript that will need your attention -- "
      report.each do |rec|
        message+=body_heping_manuscript(rec['topic'],Integer(rec['highest_priority']))
      end
    else
      message+="<br>\n  You have "+number_text(report.count)+" active manuscripts that need your attention, including:"
      i=0
      report.each do |rec|
        i+=1
        message+="<br>\n  - "+body_heping_manuscript(rec['topic'],Integer(rec['highest_priority']))
        if(report.count!=i)
          message+=','
        end
      end
    end
    message+=".<br>\n"
  end
  return message
end

def body_heping_status(status)
  message=""
  if(status.count>=1)
    data_count=0
    text_count=0
    last_text_id=-1
    i=0
    status.each do |rec|
      i+=1
      if(rec['status_id']=='2')
        data_count+=1
      elsif(rec['status_id']=='3' or rec['status_id']=='4')
        text_count+=1
        last_text_id=i
      end
    end
    if(data_count>=1)
      status.each do |rec|
        if(Integer(rec['status_id'])==2)
          message+="<br>\n  For "+rec['topic']+" manuscript, "
          if(Integer(rec['days_used'])>=3)
            message+="you have been preparing the data for "+number_text(Integer(rec['days_used']))+" days. "
          end
          if(Integer(rec['days_left'])>3)
            if(Integer(rec['days_used'])>=3)
              message+="There are still "
            else
              message+="you still have "
            end
            message+=number_text(Integer(rec['days_left']))+" more days for "+rec['description']+" data to be prepared."
          elsif(Integer(rec['days_left'])>0)
            if(Integer(rec['days_used'])>=3)
              message+="There is only "
            else
              message+="you have only "
            end
            message+=number_text(Integer(rec['days_left']))+" days left for you to prepare the "+rec['description']+" data. We hope you can get those data by the due date on "+rec['due_date']+"."
          elsif(Integer(rec['days_left'])==0)
            message+="<b>TODAY</b> is the last day you need to have the "+rec['description']+" data prepared. Please get it done in a timely manner."
          else
            message+="You are "+number_text(Integer(rec['days_left']).abs)+" days past the expected due date for the"+rec['description']+" data. Please finish the data as soon as possible. Or if you will need more time for data preparation, please update the due date accordingly in the database."
          end
          message+="<br>\n"
        end
      end
    end
    if(text_count>=1)
      message+="<br>\n  You are "
      if(data_count>=1)
        message+="also "
      end
      message+="expected to "
      i=0
      status.each do |rec|
        i+=1
        if(last_text_id==i and text_count>1)
          message+="and "
        end
        if(Integer(rec['status_id'])==3)
          message+="update the text for "
        elsif(Integer(rec['status_id'])==4)
          message+="proofread the "
        end
        if(Integer(rec['status_id'])==3 or Integer(rec['status_id'])==4)
          message+=rec['topic']+" manuscript "
          if(Integer(rec['days_left']) > 0)
            message+="within the next "+number_text(Integer(rec['days_left']))+" days"
          elsif(Integer(rec['days_left']) == 0)
            message+="today"
          else
            message+=number_text(Integer(rec['days_left']))+" days ago"
          end
        end
        if(last_text_id==i)
          message+="."
        elsif(Integer(rec['status_id'])==3 or Integer(rec['status_id'])==4)
          message+=", "
        end
      end
      message+="<br>\n"
    end
  end
  return message
end

# ... Do something with the file
conn = PGconn.open(:dbname => 'paper_prep_queue')
query = 'select person_id,firstname,lastname,email,c.days as report_freq,c.description as report_freq_str,d.days as pastdue_freq,CURRENT_DATE-begin_date as days_passed,CURRENT_DATE+c.days as next_date,to_char(CURRENT_DATE,\'MON-YYYY\') as current_month, to_char(CURRENT_TIMESTAMP, \'Dy, DD Mon YYYY HH24:MI:SS -0500\') as current_time from (select * from papers_notification where notification=\'t\') a left join papers_author b on a.person_id=b.id left join papers_frequency c on a.report_frequency_id=c.id left join papers_frequency d on a.pastdue_frequency_id=d.id;'
res = conn.exec(query)
if(res.count>=1)
  f = File.open("/var/www/railsapps/milapa/logs/"+res[0]['current_month']+".log", "a")
  f.puts "==================== log message for "+res[0]['current_time']+" ====================\n"
end
res.each do |person|
 if(Integer(person['days_passed'])>=Integer(person['report_freq']))
  f.puts "\n"
  f.puts person
  message_body = ""
  last_update=365
  is_wladek=false
  need_report=false
  if(person['firstname'].capitalize=='Wladek')
    is_wladek=true
    submit_deadline_query = 'select topic,firstname,lastname,journal_abbr,url,CURRENT_DATE-date(a.updated_at) as days_inactive,deadline-CURRENT_DATE as days_left from papers_publication a left join papers_publication_status_jcn b on a.id=b.publication_id left join papers_status c on b.status_id=c.id left join papers_author d on a.first_author_id=d.id left join papers_journal e on a.target_journal_id=e.id where priority=0 and deadline is not NULL;'
    submit_query          = 'select topic,firstname,lastname,journal_abbr,url,CURRENT_DATE-date(a.updated_at) as days_inactive from papers_publication a left join papers_publication_status_jcn b on a.id=b.publication_id left join papers_status c on b.status_id=c.id left join papers_author d on a.first_author_id=d.id left join papers_journal e on a.target_journal_id=e.id where priority=0 and deadline is NULL;'
    response_descr_query  = 'select topic,firstname,lastname,description,CURRENT_DATE-date(a.updated_at) as days_inactive from papers_publication a left join papers_publication_status_jcn b on a.id=b.publication_id left join papers_status c on b.status_id=c.id left join papers_author d on a.first_author_id=d.id where priority=1 and description ~ E\'\\\\w\';'
    response_query        = 'select topic,firstname,lastname,description,CURRENT_DATE-date(a.updated_at) as days_inactive from papers_publication a left join papers_publication_status_jcn b on a.id=b.publication_id left join papers_status c on b.status_id=c.id left join papers_author d on a.first_author_id=d.id where priority=1 and description !~ E\'\\\\w\';'
    sd = conn.exec(submit_deadline_query)
    sm = conn.exec(submit_query)
    rd = conn.exec(response_descr_query)
    rs = conn.exec(response_query)
    sd.each do |rec|
      need_report=true
      last_update=check_update(last_update,rec['days_inactive'])
    end
    sm.each do |rec|
      need_report=true
      last_update=check_update(last_update,rec['days_inactive'])
    end
    rd.each do |rec|
      need_report=true
      last_update=check_update(last_update,rec['days_inactive'])
    end
    rs.each do |rec|
      need_report=true
      last_update=check_update(last_update,rec['days_inactive'])
    end
    if(sd.count==0 and sm.count==0)
      message_body += body_wladek_comment(rd,rs)
    else
      message_body += body_wladek_submit(sd,sm,rd,rs.count)
    end
  else
    report_query = 'select topic,min(priority) as highest_priority,CURRENT_DATE-date(a.updated_at) as days_inactive from (select * from papers_publication where first_author_id='+person['person_id']+') a left join papers_publication_status_jcn b on a.id=b.publication_id left join papers_status c on b.status_id=c.id where status_id!=11 group by topic,a.updated_at;'
    status_query = 'select topic,description,status_id,due_date-CURRENT_DATE as days_left,due_date,CURRENT_DATE-date(a.updated_at) as days_used from (select * from papers_publication_status_jcn where person_responsible_id='+person['person_id']+') a left join papers_publication b on a.publication_id=b.id where status_id!=11;'
    report = conn.exec(report_query)
    status = conn.exec(status_query)
    report.each do |report_rec|
      need_report=true
      last_update=check_update(last_update,report_rec['days_inactive'])
    end
    status.each do |status_rec|
      need_report=true
      last_update=check_update(last_update,status_rec['days_used'])
    end
    message_body += body_heping_report(report)
    message_body += body_heping_status(status)
  end
  vacation_query = 'select CURRENT_DATE-begin_date as vacation_begin,end_date-CURRENT_DATE as vacation_end from papers_absence where notification=\'f\' and person_id='+person['person_id']+';'
  vacation = conn.exec(vacation_query)
  need_vacation=false
  vacation.each do |vacation_rec|
    if(Integer(vacation_rec['vacation_begin'])>=0 and Integer(vacation_rec['vacation_end'])>=0)
      need_vacation=true
    end
  end
  if(need_vacation)
    f.puts "\n--"+person['firstname']+" "+person['lastname']+" is on vacation and report will be delayed\n"
  elsif(need_report)
    boundary=(0...8).map{65.+(rand(25)).chr}.join
    message = mail_header(person['firstname'],person['lastname'],person['email'],person['current_time'],boundary)
    message+= mail_open_sentence(last_update,is_wladek)
    message+= message_body
    message+= mail_signature(person['report_freq_str'].split('_').join(' '),person['next_date'],is_wladek,boundary)
    f.puts message
    Net::SMTP.start('olenka.med.virginia.edu') do |smtp|
      smtp.send_message message, 'manuscript-db@iwonka.med.virginia.edu', person['email']
    end
    update_query = 'update papers_notification set begin_date=CURRENT_DATE where person_id='+person['person_id']+';'
    update = conn.exec(update_query)
    f.puts "\n--Email was send to "+person['email']+"\n"
  else
    f.puts "\n--"+person['firstname']+" "+person['lastname']+" does not need a report\n"
  end
 end
end
if(res.count>=1)
  f.close
end

