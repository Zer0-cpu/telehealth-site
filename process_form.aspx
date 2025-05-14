<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net.Mail" %>
<!DOCTYPE html>
<html>
<head>
    <title>Form Processing</title>
</head>
<body>
    <%
        try {
            string name = Request.Form["name"];
            string email = Request.Form["email"];
            string message = Request.Form["message"];

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("your-email@example.com");
            mail.To.Add("recipient@example.com");
            mail.Subject = "Telehealth Contact Form Submission";
            mail.Body = $"Name: {name}\nEmail: {email}\nMessage: {message}";

            SmtpClient smtp = new SmtpClient("smtp.example.com", 587);
            smtp.Credentials = new System.Net.NetworkCredential("your-email@example.com", "your-password");
            smtp.EnableSsl = true;
            smtp.Send(mail);

            Response.Write("<p>Thank you! Your message has been sent.</p>");
        }
        catch (Exception ex) {
            Response.Write("<p>Error: " + ex.Message + "</p>");
        }
    %>
</body>
</html>