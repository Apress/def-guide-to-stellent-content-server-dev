package mypackage;

import intradoc.upload.UploadSecurityImplementor;

public class MySecurityImplementor extends UploadSecurityImplementor
{
    public String determineUser(Service service, DataBinder binder)
    {
        intradoc.shared.PluginFilters.filter("securityImplementorDetermineUser",
            workspace, binder, service);
        super.determineUser(service, binder);
    }
}
