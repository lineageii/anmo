package org.springside.examples.miniweb.webqq;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.meterware.httpunit.ClientProperties;
import com.meterware.httpunit.GetMethodWebRequest;
import com.meterware.httpunit.HttpUnitOptions;
import com.meterware.httpunit.PostMethodWebRequest;
import com.meterware.httpunit.WebConversation;
import com.meterware.httpunit.WebResponse;

public class SmailImpl implements ISmail {
	private Log log = LogFactory.getLog(this.getClass());
	private WebConversation wc;
	private String id;
	private String password;
	private String psessionid;
	private String vfwebqq;
	private String sid;
	private String nUin;

	public SmailImpl() {
	}

	public SmailImpl(String id, String password) throws Exception {
		this.id = id;
		this.password = password;
		login();
	}

	@Override
	public void send(Smail smail) {
		// TODO Auto-generated method stub

	}

	@Override
	public Smail receive() {
		// TODO Auto-generated method stub
		return null;
	}

	private void setCookie(WebResponse rs) {
		String[] cookies = rs.getHeaderFields("set-cookie");
		for (String cookie : cookies) {
			String firstCookie = cookie.split(";")[0];
			String[] cookieStr = firstCookie.split("=");
			if (cookieStr.length == 2) {
				wc.putCookie(cookieStr[0], cookieStr[1]);
			} else {
				wc.putCookie(cookieStr[0], "");
			}

		}
	}

	public void login() throws Exception {
		wc = new WebConversation();
		HttpUnitOptions.setDefaultCharacterSet("utf-8");
		HttpUnitOptions.setScriptingEnabled(false);
		HttpUnitOptions.setExceptionsThrownOnScriptError(false);
		//HttpUnitOptions.setLoggingHttpHeaders(true);
		HttpUnitOptions.setAcceptCookies(true);
		wc.setUserAgent("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.12 (KHTML, like Gecko) Chrome/9.0.587.0 Safari/534.12");
		ClientProperties.getDefaultProperties().setAcceptCookies(true);

		WebResponse rs;
		//rs= wc.getResponse("http://web2.qq.com/");
		//setCookie(rs);

		String url = "http://ptlogin2.qq.com/check?uin=" + this.id + "&appid=1003903&r=0.3622996990703624";
		rs = wc.getResponse(url);
		setCookie(rs);
		log.info("response:" + rs.getText());
		String verifycode = rs.getText().split(",")[1].replaceAll("'", "").replace(");", "");
		log.info(this.toString() + " verifycode:" + verifycode);

		// 需要输入验证码
		if (verifycode.length() > 10) {
			log.error("需要验证码!");
			throw new Exception("需要验证码!");
		}

		String p = PasswordEncrypt.passwordEcrypt(this.password, verifycode);
		log.info("p:" + p);

		GetMethodWebRequest get = new GetMethodWebRequest("http://ptlogin2.qq.com/login");
		get.setParameter("u", this.id);
		get.setParameter("p", p);
		get.setParameter("verifycode", verifycode);
		get.setParameter("remember_uin", "1");
		get.setParameter("aid", "1003903");
		get.setParameter("u1", "http://web2.qq.com/loginproxy.html?login_level=3");
		get.setParameter("h", "1");
		get.setParameter("ptredirect", "0");
		get.setParameter("ptlang", "2052");
		get.setParameter("from_ui", "1");
		get.setParameter("pttype", "1");
		get.setParameter("dumy", "");
		get.setParameter("fp", "loginerroralert");
		get.setParameter("mibao_css", "");

		rs = wc.getResponse(get);
		setCookie(rs);
		log.info("response:" + rs.getText());

		rs = wc.getResponse("http://web2.qq.com/loginproxy.html?login_level=3");
		setCookie(rs);

		PostMethodWebRequest post = new PostMethodWebRequest("http://d.web2.qq.com/channel/login2");
		String ptwebqq = wc.getCookieValue("ptwebqq");
		log.info("ptwebqq:" + ptwebqq);
		String r = "{\"status\":\"\",\"ptwebqq\":\"" + ptwebqq
				+ "\",\"passwd_sig\":\"\",\"clientid\":\"292167\",\"psessionid\":null}";
		//{"status":"","ptwebqq":"7896466821f021f41ba65eb83d689e671d7b08eb02c0c165ef8589bb772cf9db","passwd_sig":"","clientid":"292167","psessionid":null}
		post.setParameter("r", r);

		wc.setHeaderField("Referer", "http://d.web2.qq.com/proxy.html?v=20101025002");
		wc.putCookie("pgv_pvid", "215336480");
		wc.putCookie("pgv_flv", "10.1 r102");
		wc.putCookie("pgv_info", "pgvReferrer=&ssid=s7792437458");

		//		rs = wc.getResponse(post);
		//
		//		log.info("login response:" + rs.getText());
		//		JSONObject result = new JSONObject(rs.getText()).getJSONObject("result");
		//		this.psessionid = result.getString("psessionid");
		//		this.vfwebqq = result.getString("vfwebqq");
		//		log.info("psessionid:" + psessionid);
	}

	public void loginMail() throws Exception {
		String url = "http://mail.qq.com/cgi-bin/login?fun=passport&from=webqq";
		String res = wc.getResponse(url).getText();
		//log.info("loginMail:" + res);
		Matcher matcher = Pattern.compile("sid=.*?\";").matcher(res);
		if (matcher.find()) {
			this.sid = matcher.group().replace("sid=", "").replace("\";", "");
			log.info("sid:" + sid);
		} else {
			throw new Exception("Can't find sid");
		}

	}

	//http://msgopt.mail.qq.com/cgi-bin/readtemplate?folderid=9&page=0&t=sms_list_v2&sid=7yD2McQPTAOBTD5w&nocheckframe=true#compose
	public void initSendSmail() throws Exception {
		String url = "http://msgopt.mail.qq.com/cgi-bin/readtemplate?folderid=9&page=0&t=sms_list_v2&sid=" + this.sid
				+ "&nocheckframe=true#compose";
		String res = wc.getResponse(url).getText();
		//log.info("loginMail:" + res);
		Matcher matcher = Pattern.compile("sEncryptUin : .*?\",").matcher(res);
		if (matcher.find()) {
			this.nUin = matcher.group().replace("sEncryptUin : \"", "").replace("\",", "");
			log.info("nUin:" + nUin);
		} else {
			throw new Exception("Can't find nUid");
		}
	}

	//http://msgopt.mail.qq.com/cgi-bin/CommCgi?sid=zQLvBPExo_xuKVsV&res=ConvsRes
	//resp_charset UTF8
	//f json
	//requests_array [{
	// "Header":{"sResId":"SmsRes","sMethod":"Create","sRandId":48832},
	// "Data":{"sAction":"createroom","oMembers":[{"sAddress":"63090585@qq.com","sName":"63090585"},{"sAddress":"1917842895@qq.com","nUin":"-1664313091","sName":"我"}],
	// "oMailIndex":{"oFrom":[{"sAddress":"1917842895@qq.com","nUin":"-1664313091","sName":"我"}],
	// "oTo":[{"sAddress":"63090585@qq.com","sName":"63090585"}],
	// "nToTime":1317196993,"sMailBuss":"ml","sAbstract":"1111"},"sReadType":"List"}}]

	//[{"Header":{"sResId":"SmsRes","sMethod":"Create","sRandId":76352},"Data":{"sAction":"createroom","oMembers":[{"sAddress":"63090585@qq.com","sName":"63090585"},{"sAddress":"1917842895@qq.com","nUin":"-1664313091","sName":"我"}],"oMailIndex":{"oFrom":[{"sAddress":"1917842895@qq.com","nUin":"-1664313091","sName":"我"}],"oTo":[{"sAddress":"63090585@qq.com","sName":"63090585"}],"nToTime":1317198090,"sMailBuss":"ml","sAbstract":"55555"},"sReadType":"List"}}]
	public void sendSmail(String to, String message) throws Exception {
		String url = "http://msgopt.mail.qq.com/cgi-bin/CommCgi?sid=" + this.sid + "&res=ConvsRes";
		String requests_array = "[{\"Header\":{\"sResId\":\"SmsRes\",\"sMethod\":\"Create\",\"sRandId\":76354},\"Data\":{\"sAction\":\"createroom\",\"oMembers\":[{\"sAddress\":\""
				+ to
				+ "@qq.com\",\"sName\":\""
				+ to
				+ "\"},{\"sAddress\":\""
				+ this.id
				+ "@qq.com\",\"nUin\":\""
				+ this.nUin
				+ "\",\"sName\":\"我\"}],\"oMailIndex\":{\"oFrom\":[{\"sAddress\":\""
				+ this.id
				+ "@qq.com\",\"nUin\":\""
				+ this.nUin
				+ "\",\"sName\":\"我\"}],\"oTo\":[{\"sAddress\":\""
				+ to
				+ "@qq.com\",\"sName\":\""
				+ to
				+ "\"}],\"nToTime\":1317198090,\"sMailBuss\":\"ml\",\"sAbstract\":\""
				+ message + "\"},\"sReadType\":\"List\"}}]";
		PostMethodWebRequest post = new PostMethodWebRequest(url);
		post.setParameter("resp_charset", "UTF8");
		post.setParameter("f", "json");
		post.setParameter("requests_array", requests_array);
		WebResponse rs = wc.getResponse(post);
		log.info("requests_array:" + requests_array);
		log.info("login response:" + rs.getText());
		Matcher matcher = Pattern.compile("sTid:\".*?\"").matcher(rs.getText());
		String sTid = "";
		if (matcher.find()) {
			sTid = matcher.group().replace("sTid:\"", "").replace("\"", "");
			log.info("sTid:" + sTid);
		} else {
			throw new Exception("Can't find nUid");
		}

		String url2 = "http://msgopt.mail.qq.com/cgi-bin/CommCgi?sid=" + this.sid + "&res=MsgsRes";
		requests_array = "[{\"Header\":{\"sResId\":\"SmsRes\",\"sMethod\":\"Create\",\"sRandId\":49825},\"Data\":{\"oMailIndex\":{\"oFrom\":[{\"sAddress\":\""
				+ this.id
				+ "@qq.com\",\"nUin\":\""
				+ this.nUin
				+ "\",\"sName\":\"我\"}],\"oTo\":[{\"sAddress\":\""
				+ to
				+ "@qq.com\",\"sName\":\""
				+ to
				+ "\"}],\"nToTime\":1317200932,\"sMailBuss\":\"ml\",\"sAbstract\":\""
				+ message
				+ "\",\"sSubject\":\""
				+ message
				+ "\",\"nXQQStyle\":0},\"sTid\":\""
				+ sTid
				+ "\",\"sAction\":\"send\",\"sMailContent\":\"" + message + "\",\"sReadType\":\"Item\"}}]";
		post = new PostMethodWebRequest(url2);
		post.setParameter("resp_charset", "UTF8");
		post.setParameter("f", "json");
		post.setParameter("requests_array", requests_array);
		rs = wc.getResponse(post);
		log.info("requests_array:" + requests_array);
		log.info("login response:" + rs.getText());
	}
}
