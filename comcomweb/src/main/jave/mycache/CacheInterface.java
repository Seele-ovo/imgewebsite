package jave.mycache;

public interface CacheInterface<T extends Comparable<T>> {
    T get(T id);
    void insert(T data);
    void inOrder();
    boolean isEmpty();
}
