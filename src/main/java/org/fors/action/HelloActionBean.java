package org.fors.action;

import net.sourceforge.stripes.action.*;

@UrlBinding("/hello.action")
public class HelloActionBean implements ActionBean {
    private ActionBeanContext context;

    @Override
    public ActionBeanContext getContext() {
        return context;
    }

    @Override
    public void setContext(ActionBeanContext context) {
        this.context = context;
    }

    @DefaultHandler
    public Resolution hello() {
        return new ForwardResolution("/WEB-INF/jsp/hello.jsp");
    }
}