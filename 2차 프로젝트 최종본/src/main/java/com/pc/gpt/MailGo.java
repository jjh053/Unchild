package com.pc.gpt;


import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
/**
 * Servlet implementation class MailGo
 */
@WebServlet("/mailGo")
public class MailGo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final int CHECK_MSG = 0;
	private static final int ERROR_MSG = 1;

	private String code = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("mailGo > doPost 실행");
		
		String sendCode = request.getParameter("confirm");
		System.out.println("sendCode : " + sendCode);

		if (sendCode == null || "".equals(sendCode.trim())) {
			System.out.println("doPost 실행 성공");
			String email = request.getParameter("email");
			System.out.println("email : " + email);

			code();

			System.out.println("랜덤 코드 : " + code);
			sendEmail(email, "회원가입을 위한 인증번호", code);
		} else {
			if (code.equals(sendCode)) {
				response.getWriter().println(CHECK_MSG);
			} else {
				response.getWriter().println(ERROR_MSG);
			}

		}

	}

	private void code() {
		String total = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder code = new StringBuilder();
		Random random = new Random();

		for (int i = 0; i < 8; i++) {
			code.append(total.charAt(random.nextInt(total.length())));
		}

		this.code = code.toString();
	}

	private void sendEmail(String to, String subject, String message) {
		String smtpHost = "smtp.gmail.com"; // 어디 플랫폼인지
		int smtpPort = 587; // SMTP 포트
		String smtpUser = "xkfkrehdus2@gmail.com"; // 이메일 주소
		String smtpPassword = "wrpy oafq onkp oska"; // 발급 받은 비밀번호

		Properties props = new Properties();
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

		props.put("mail.smtp.host", smtpHost);
		props.put("mail.smtp.port", smtpPort);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(smtpUser, smtpPassword);
			}
		});

		try {
			Transport transport = session.getTransport("smtp");
			transport.connect(smtpHost, smtpPort, smtpUser, smtpPassword);

			MimeMessage emailMessage = new MimeMessage(session);

			String htmlContent = ""
					+ "	<table align=\"center\" style=\" border:1px solid #dedede; border-spacing: 0px; width: 600; max-width:600px; border:1px solid #dedede; border-spacing: 0px; width: 600; max-width:600px; background-color:#ffffff;\">\r\n"
					+ "		<tbody>"
					+ "			<tr>"
					+ "				<td>"
					+ "					<table style=\"width: 100%\">"
					+ "						<tbody>"
					+ "							<tr style='background-color: #ccc'>"
					+ "								<td align=\"center\" style=\"align: center; vertical-align: top; padding:23px 0;\">"
					+ "									<img style=\" vertical-align: middle\" src='https://cdn.discordapp.com/attachments/1186454147558551552/1226078013200797756/logo.png?ex=66237521&is=66110021&hm=05fee945f4b83644150dead9945bad5e72216463774b806a09ef5c98089221dc&'>"
					+ "								</td>"
					+ "							</tr>"
					+ "						</tbody>"
					+ "					</table>"
					+ "				</td>"
					+ "			</tr>"
					+ "			<tr>"
					+ "				<td style=\" vertical-align: top; padding: 30px 25px; border-top:1px solid #e0e0e0; font-weight:400; font-size:14px; line-height:22px; color: #455A64\">\r\n"
					+ "        			<div style=\"color:#263238; font-weight:700; font-size:20px; font-family: Google Sans, Roboto, sans-serif; line-height:26px; padding:0 0;\">\r\n"
					+ 						to.split("@")[0]
					+ "						님 안녕하세요!"
					+ "        			</div>"
					+ "        			<p style=\"margin-top: 1.5rem; padding:0 0; font-size:17px;\">\r\n"
					+ "            			J_company 입사를 환영합니다!"
					+ "        			</p>"
					+ "       			<p style=\"margin-top: 0.5rem; font-size:17px;\">"
					+ "            			시작하려면 인증번호를 입력해주세요."
					+ "        			</p>"
					+ "        			<p style=\"margin-top: 2rem; font-size:17px;\">\r\n"
					+ "            			인증번호 : " + code
					+ "       			</p>"
					+ "        		</td>"
					+ "			</tr>"
					+ "			<tr>"
					+ "				<td style=\" text-align: center; vertical-align: top; background-color: #ccc; padding:24px 24px;\">"
					+ "					<table style=\" width:100%; border: 0; border-spacing: 0px; border-collapse: separate; padding: 0;\">\r\n"
					+ "						<tbody>"
					+ "							<tr>"
					+ "								<td>"
					+ "									<img alt=\"AI Greem\" src='https://cdn.discordapp.com/attachments/1186454147558551552/1226078013200797756/logo.png?ex=66237521&is=66110021&hm=05fee945f4b83644150dead9945bad5e72216463774b806a09ef5c98089221dc&' height=\"44\" width=\"150\" style=\"display:block;\">"
					+ "								</td> "
					+ "								<td align=\"right\" valign=\"middle\" style=\"color:#D6DDE1; color: #000; font-weight:400; font-size:12px; line-height:14px; padding:0 0;\">"
					+ "									본 메일은 개인정보취급방침에 따라 발송되었습니다.<br>"
					+ "									© 2024 J_Company. All rights reserved."
					+ "								</td>"
					+ "							</tr>"
					+ "						</tbody>"
					+ "					</table>"
					+ "				</td>"
					+ "			</tr>"
					+ "		</tbody>"
					+ "</table>";

			emailMessage.setFrom(new InternetAddress(smtpUser, "J_company"));
			emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			emailMessage.setSubject(subject, "UTF-8");
			emailMessage.setContent(htmlContent, "text/html; charset=utf-8");

			transport.sendMessage(emailMessage, emailMessage.getAllRecipients());

			transport.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
