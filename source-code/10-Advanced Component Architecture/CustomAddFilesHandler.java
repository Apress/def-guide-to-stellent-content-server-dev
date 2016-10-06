package helloworld;

import intradoc.common.ServiceException;
import intradoc.data.DataException;
import intradoc.data.DataBinder;
import intradoc.server.ServiceHandler;

public class CustomAddFilesHandler extends ServiceHandler
{
	public void addFiles() throws
		ServiceException, DataException
	{
		// custom code before 'addFiles' is called

		// only execute custom code for CHECKIN_NEW_SUB
		String idcService = m_binder.getLocal("IdcService");
		if (idcService.equals("CHECKIN_NEW_SUB")
		{
			// call the core 'addFiles' method, or the next one
			// in the searchOrder
			m_service.doCodeEx("addFiles", this);
		}

		// custom code for after 'addFiles' is called
	}
}

