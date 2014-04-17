package com.trader.platform.api;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;

import nl.justobjects.pushlet.core.Event;
import nl.justobjects.pushlet.core.EventPullSource;

public class PushletDemo implements Serializable{

	private static final long serialVersionUID = 7753669613431831941L;

	public static class HWPushlet extends EventPullSource {

		@Override
		protected long getSleepTime() {
			return 1000;//每一秒钟自动执行一次
		}

		@Override
		protected Event pullEvent() {
			 Event event = Event.createDataEvent("/trader/pushlet.demo");
             String data= "hello,world guoqiang "+System.currentTimeMillis();
             try {
                  data=new String(data.getBytes("UTF-8"),"ISO-8859-1");
             } catch (UnsupportedEncodingException e) {
                  e.printStackTrace();
             }
             event.setField("hw",data);
             return event;
		}
		
	}
}
