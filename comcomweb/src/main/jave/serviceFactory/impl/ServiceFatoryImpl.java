package jave.serviceFactory.impl;

import jave.serviceFactory.ServiceFactory;

public class ServiceFatoryImpl implements ServiceFactory {
    @Override
    public Object newInstance(Class clazz) {
        if (clazz != null) {
            try {
                return clazz.newInstance();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
