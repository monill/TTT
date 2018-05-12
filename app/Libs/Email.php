<?php

namespace App\Libs;

use PHPMailer\PHPMailer\PHPMailer;

class Email extends PHPMailer
{
    public function confirmEmail($email, $user_id, $hash)
    {
        $mail = $this->sendMail();      // get instance of PHPMailer (including some additional info)
        $mail->addAddress($email);      // where you want to send confirmation email

        $link = URL . "/signup/activeac/" . $user_id . "/" . $hash;        // link for email confirmation
        $body = file_get_contents(DATA. "emails/confirmacc.php");      // load email HTML template

        $body = str_replace("{{website_name}}", SNAME, $body);              // replace appropriate placeholders
        $body = str_replace("{{link}}", $link, $body);

        $mail->Subject = SNAME . " - Email confirmation.";                  // set subject and body
        $mail->Body = $body;

        // try to send the email
        if (!$mail->send()) {
            echo "Message can not be sent.\n";
            echo "Mail error: " . $mail->ErrorInfo;
            exit();
        }
        $mail->clearAllRecipients();
    }

    public function thanks($email)
    {
        $mail = $this->sendMail();
        $mail->addAddress($email);

        $body = file_get_contents(DATA . "emails/thanks.php");

        $body = str_replace("{{website_name}}", SNAME, $body);
        $body = str_replace("{{rulink}}", URL . '/rules', $body);
        $body = str_replace("{{falink}}", URL . '/faq', $body);

        $mail->Subject = SNAME . " - Thank you for sign-up.";
        $mail->Body = $body;

        if (!$mail->send()) {
            echo "Message can not be sent. \r\n";
            echo "Mail error: " . $mail->ErrorInfo;
            exit();
        }
        $mail->clearAllRecipients();
    }

    public function resetPass($email, $key)
    {
        $mail = $this->sendMail();
        $mail->addAddress($email);

        $link = URL . "/recoverac/code/" . $key;
        $body = file_get_contents(DATA . "emails/resetpassword.php");

        $body = str_replace("{{ip}}", Helper::getIP(), $body);
        $body = str_replace("{{website_name}}", SNAME, $body);
        $body = str_replace("{{link}}", $link, $body);

        $mail->Subject = SNAME . " - Password Reset.";
        $mail->Body = $body;

        if (!$mail->send()) {
            echo "Message can not be sent.\r\n";
            echo "Mail error: " . $mail->ErrorInfo;
            exit();
        }
        $mail->clearAllRecipients();
    }

    public function invite($email, $key)
    {
        $mail = $this->sendMail();
        $mail->addAddress($email);

        $link = URL . "/signup/invite/" . $key;
        $body = file_get_contents(DATA . "emails/invitation.php");

        $body = str_replace("{{website_name}}", SNAME, $body);
        $body = str_replace("{{invlink}}", $link, $body);

        $mail->Subject = SNAME . " - user invitation confirmation.";
        $mail->Body = $body;

        if (!$mail->send()) {
            echo "Message can not be sent.\r\n";
            echo "Mail error: " . $mail->ErrorInfo;
            exit();
        }
        $mail->clearAllRecipients();
    }

    /**
    * Private area
    */
    private function sendMail()
    {
        $mail = new PHPMailer();

        try {
            //Server settings
            $mail->isSMTP();                                      // Set mailer to use SMTP
            $mail->SMTPOptions = [
                'ssl' => [
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                ]
            ];
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            $mail->SMTPDebug = 0;                                 // Enable verbose debug output
            $mail->Mailer = MAILER;
            $mail->AuthType = SMTP_AUTHTYPE;
            $mail->SMTPAutoTLS = '';
            $mail->Host = SMTP_HOST;                              // Specify main and backup SMTP servers
            $mail->Username = SMTP_USERNAME;                      // SMTP username
            $mail->Password = SMTP_PASSWORD;                      // SMTP password
            $mail->SMTPSecure = SMTP_ENCRYPTION;                  // Enable TLS encryption, `ssl` also accepted
            $mail->Port = SMTP_PORT;                              // TCP port to connect to

            $mail->CharSet = "UTF-8";
            $mail->isHTML(true);                            // tell mailer that we are sending HTML email

            $mail->From = FROM_MAIL;
            $mail->FromName = SNAME;
            $mail->addReplyTo(FROM_MAIL, SNAME);
        } catch (\Exception $exc) {
            echo "E-mail not send. \n\r";
            echo $exc->getMessage();
        }
        return $mail;
    }
}
