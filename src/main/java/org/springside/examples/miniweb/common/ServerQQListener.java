package org.springside.examples.miniweb.common;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springside.examples.miniweb.webqq.ServerQQ;
import org.springside.examples.miniweb.webqq.SmailImpl;

public class ServerQQListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		ApplicationContext wac = new ClassPathXmlApplicationContext("applicationContext.xml");
		try {
			String id = "1917842895";
			SmailImpl smailImpl = new SmailImpl(id, "huyang,./");
			smailImpl.loginMail();
			smailImpl.initSendSmail();
			final ServerQQ serverQQ = wac.getBean(ServerQQ.class);

			serverQQ.setSmailImpl(smailImpl);
			new Thread(new Runnable() {
				@Override
				public void run() {
					while (true) {
						new Thread(serverQQ).start();
						try {
							Thread.sleep(2000);
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

				}

			}).start();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub

	}

	public static void main(String[] args) {
		new ServerQQListener().contextInitialized(null);
	}

}
