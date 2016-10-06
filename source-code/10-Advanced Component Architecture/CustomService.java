package helloworld;

import intradoc.common.ServiceException;
import intradoc.data.DataException;
import intradoc.data.DataBinder;
import intradoc.server.Service;

public class CustomService extends Service
{
	public void helloWorld_sayHello()
		throws DataException, ServiceException
	{
		//String param1 = m_currentAction.getParamAt(0);
		//String param2 = m_currentAction.getParamAt(1);

		//String prefix = m_binder.getLocal("prefix");
		//m_binder.putLocal("StatusMessage", prefix + "\nHello World!");

		m_binder.putLocal("StatusMessage", "Hello World!");

	}
}
