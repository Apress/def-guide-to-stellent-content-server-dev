package mypackage;

import intradoc.common.ExecutionContext;
import intradoc.common.ServiceException;
import intradoc.data.DataBinder;
import intradoc.data.DataException;
import intradoc.data.Workspace;
import intradoc.shared.FilterImplementor;

public class MyFilter implements FilterImplementor
{
    public int doFilter(Workspace ws, DataBinder binder,
        ExecutionContext cxt)
        throws DataException, ServiceException
    {
        // put code here
        return CONTINUE;
    }
}
