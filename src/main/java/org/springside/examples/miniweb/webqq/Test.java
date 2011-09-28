package org.springside.examples.miniweb.webqq;

public class Test {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		SmailImpl smailImpl = new SmailImpl("1917842895", "huyang,./");
		smailImpl.loginMail();
		smailImpl.initSendSmail();
		smailImpl.sendSmail("63090585", "111111");
	}

}
