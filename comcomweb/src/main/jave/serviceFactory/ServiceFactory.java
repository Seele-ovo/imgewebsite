package jave.serviceFactory;

/**
 * 利用反射加工厂方法模式
 */
public interface ServiceFactory {
    Object newInstance(Class clazz);
}
