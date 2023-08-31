package com.helperPackage.govgrants;

import com.helperPackage.misclib.Emails;
import com.helperPackage.register.I;
import org.openqa.selenium.By;

import javax.mail.Message;
import javax.mail.MessagingException;

public class Email {

    /**
     * to validate the subject of email
     *
     * @param userName
     * @param password
     * @param hostName
     * @param withInNumberOfMessages
     * @param validationSubject
     * @return true/false
     * @author nauman.shahid
     */
    public boolean isSubjectEmailReceived(String userName, String password, String hostName, int withInNumberOfMessages, String validationSubject) {
        var isSubjectVerified = false;
        Emails.EmailMethods gmailLoggedInInstance = I.amPerforming().emailOperationsTo().accessEmail(userName, password,
                Emails.HostName.valueOf(hostName),
                Emails.MailClient.valueOf(hostName),
                Emails.EmailFolder.INBOX);

        Message[] messages = new Message[0];
        try {
            messages = gmailLoggedInInstance.getMessages(withInNumberOfMessages);
        } catch (MessagingException e) {
            // default try catch
        }
        var startTime = System.currentTimeMillis() / 1000 + 300;
        while ((System.currentTimeMillis() / 1000) < startTime && !isSubjectVerified) {
            for (int i = 0; i <= 5; i++) {
                try {
                    if (messages[i].getSubject().contains(validationSubject)) {
                        isSubjectVerified = true;
                        break;
                    }
                } catch (MessagingException e) {
                    // default try catch
                }
            }
            I.amPerforming().waitFor().makeThreadSleep(2000);
        }
        return isSubjectVerified;
    }

    /**
     * to validate the subject of email
     *
     * @param mailid
     * @author keerti.munde
     * @modifier aashish.pardeshi -- added condition for maildrop portal 28/04/2021
     * @modifier saranjit.modak -- added xpath 13/07/2021
     * @modifier komal.mukhekar -- added step to clear text from input field
     */
    public void ckeckoutYopMail(String mailportal,String mailid) {
        if(mailportal.equals("maildrop")) {
            String[] mailArray = mailid.split("@", 2);
            mailid=mailArray[0];
            I.amPerforming().browserOperationsTo().navigateToUrl("http://www.maildrop.cc/");
            I.amPerforming().textInput().toClear(By.xpath("//div[contains(@class,'logotype')]/ancestor::div/following-sibling::div//input[@placeholder='view-this-inbox']"));
            I.amPerforming().textInput().in(By.xpath("//div[contains(@class,'logotype')]/ancestor::div/following-sibling::div//input[@placeholder='view-this-inbox']"), mailid);
            I.amPerforming().click().on(By.xpath("//div[contains(@class,'logotype')]/ancestor::div/following-sibling::div//button/span[text()='View Inbox']"));
        }else {
            I.amPerforming().browserOperationsTo().navigateToUrl("http://www.yopmail.com/en/");
            I.amPerforming().textInput().toClear(By.xpath("//input[@id='login']"));
            I.amPerforming().textInput().in(By.xpath("//input[@id='login']"), mailid);
            I.amPerforming().click().on(By.xpath("//input[@value='Check Inbox' and @type='submit'] | //button[@title='Check Inbox @yopmail.com']/i"));
        }

    }
}
