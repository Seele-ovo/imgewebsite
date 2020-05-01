package jave.mycache;


/**
 * 从写以便
 * 1.avl树的难点为，插入的时候会计算当前结点是否不平衡，利用回溯原理一层一层的回去一层层判断
 * 2. 泛型，这种树结构需要用到泛型来进行约束因为它具有通用性，
 * 3. 因为需要用到判断存入的类型需要继承
 */
public class MyCache<T extends Comparable<T>> implements CacheInterface<T>{
    private Node<T> mroot;
    //查找方法
    @Override
    public T get(T id) {
        if (id == null) {
            throw new RuntimeException("id is not null");
        }

        return get(id, mroot);
    }

    private T get(T id, Node<T> node){
        if (node != null) {
            if (id.compareTo(node.item) == 0) {
                return node.item;
            }else if (id.compareTo(node.item) < 0) {
                return get(id, node.left);
            }else {
                return get(id, node.right);
            }
        }
        return null;

    }
    //静态内部类，树
    private static class Node<T extends Comparable<T>>{
        T item;//存入的具体数据
        Node<T> left;//左子树
        Node<T> right;//右子树
        int height;//高度

        public Node(T item, Node<T> left, Node<T> right) {
            this.item = item;
            this.left = left;
            this.right = right;
            this.height = 0;
        }
    }

    //内部方法获取长度
    private int height(Node<T> node){
        return node == null ? -1 : node.height;
    }
    private Node<T> leftRotation(Node<T> node){
        Node<T> h = node.right;
        node.right = h.left;
        h.left = node;
        node.height = Math.max(height(node.left), height(node.right)) + 1;
        h.height = Math.max(height(h.right), node.height)+1 ;
        return h;
    }

    //右旋转
    private Node<T> rightRotation(Node<T> node){
        Node<T> h = node.left;
        node.left = h.right;
        h.right = node;
        node.height = Math.max(height(node.left), height(node.right)) + 1;
        h.height = Math.max(height(h.left), node.height)+1 ;
        return h;
    }
    //先左在右
    private Node<T> leftRightRotation(Node<T> k3) {
        k3.left = leftRotation(k3.left);
        return rightRotation(k3);
    }
    //先右在左
    private Node<T> rightLeftRotation(Node<T> k1) {
        k1.right = rightRotation(k1.right);

        return leftRotation(k1);
    }
    //生成一颗avl树
    private Node<T> insert(Node<T> node, T data){
        if (node == null) {//递归到结点的null
            if (data == null) {
                throw new RuntimeException("data is not null");
            }
            return new Node<T>(data,null,null);
        }
        if (data.compareTo(node.item) < 0) {
            //说明要想左子树插入
            node.left = insert(node.left, data);
            if (height(node.left) - height(node.right) == 2) {
                if (data.compareTo(node.left.item) < 0) {
                    node = rightRotation(node);
                }else {
                    node = leftRightRotation(node);
                }
            }
        }else {
            node.right = insert(node.right,data);
            if (height(node.right) - height(node.left) == 2) {
                if (data.compareTo(node.right.item) > 0) {
                    node = leftRotation(node);
                }else {
                    node = rightLeftRotation(node);
                }
            }
        }
        node.height = Math.max(height(node.left), height(node.right)) + 1;
        return node;
    }

    @Override
    public void insert(T data){
        mroot = insert(mroot, data);
    }
    private void inOrder(Node<T> tree) {
        if(tree != null)
        {
            inOrder(tree.left);
            inOrder(tree.right);
            System.out.print(tree.item+" ");
        }
    }
    @Override
    public void inOrder(){
        inOrder(mroot);
    }

    @Override
    public boolean isEmpty() {
        return mroot == null ? true : false;
    }
}
