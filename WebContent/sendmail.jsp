<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>

<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%
    //Creating a result for getting status that messsage is delivered or not!
    String result;
    // Get recipient's email-ID, message & subject-line from index.html page
    final String to = request.getParameter("uemail");
    final String subject = request.getParameter("usubject");
    final String messg = request.getParameter("umessage");
 
    // Sender's email ID and password needs to be mentioned
    final String from = "pjapan500@gmail.com";
    final String pass = "japan1998";
 
 
    // Defining the gmail host
    String host = "smtp.gmail.com";
 
    // Creating Properties object
    Properties props = new Properties();
 
    // Defining properties
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    //props.put("properties.mail.smtp.starttls.required","true");
    props.put("mail.user", from);
    props.put("mail.password", pass);
    props.put("mail.debug", "true");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.ssl.protocols","TLSv1.2");
    //props.put("mail.smtp.socketFactory.port","587");
    //props.put("mail.smtp.socketFactory.fallback", "false");
    //props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
    //props.put("mail.smtp.ssl.trust", "*");
 
    //props.setProperty("mail.smtp.socketFactory.port", "587");
 
    // Authorized the Session object.
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);
        }
    });
    
    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);
        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));
        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
        // Set Subject: header field
        message.setSubject(subject);
        // Now set the actual message
        message.setText(messg);
        // Send message
        Transport.send(message);
        result = "mail sent successfully ";
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error: unable to send mail....";
    }finally{response.sendRedirect("Index.jsp");}
%>
<!--<h2>Sending Mail</h2>
<h2><font color="blue">Result</font></h2>
<b><font color="green"><%=result%></font></b>-->
