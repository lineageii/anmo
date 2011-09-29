package org.springside.examples.miniweb.webqq;

/**
 * 接收消息
 *
 */
public class GMessage {
	String sAddress;
	String sName;
	String nUin;
	String sAbstract;
	String sSubject;
	String sMailId;
	String sTid;

	public String getsAddress() {
		return sAddress;
	}

	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getnUin() {
		return nUin;
	}

	public void setnUin(String nUin) {
		this.nUin = nUin;
	}

	public String getsAbstract() {
		return sAbstract;
	}

	public void setsAbstract(String sAbstract) {
		this.sAbstract = sAbstract;
	}

	public String getsSubject() {
		return sSubject;
	}

	public void setsSubject(String sSubject) {
		this.sSubject = sSubject;
	}

	public String getsMailId() {
		return sMailId;
	}

	public void setsMailId(String sMailId) {
		this.sMailId = sMailId;
	}

	public String getsTid() {
		return sTid;
	}

	public void setsTid(String sTid) {
		this.sTid = sTid;
	}

	@Override
	public String toString() {
		return "GMessage [sAddress=" + sAddress + ", sName=" + sName + ", nUin=" + nUin + ", sAbstract=" + sAbstract
				+ ", sSubject=" + sSubject + ", sMailId=" + sMailId + ", sTid=" + sTid + "]";
	}

}
