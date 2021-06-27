---
layout: post
title:  "Design Pattern Note"
date: 2021-06-05 19:10:10 +0800
categories: [Design Pattern]
tags: [Design Pattern]
--- 

# Principle.
Open Close principle. Liskov Substitution Principle. Dependence Inversion Principle. Interface Segregation Principle. Demeter Principle. Principle of single responsibility.

# Singleton.
a class has only one instance which provide a global access pointer to this instance.  

### Code.
```
class singleton{
private:
    string value;
    static singleton* singleton_;
private:
    singleton(){};
public:
    singleton* getinstance(){
        if (singleton_ == NULL){
            singleton_ = new singleton();
        }
        return singleton_;
    }
};
singleton* singleton::singleton_ = nullptr;
```

### application.
PC. task management. thread pool.  


# factory mode.
### what is factory mode.

### code.
```
// factory mode.
class product {
public:
    product(){};
    virtual void show() = 0;
};
// product A.
class productA : public product{
public:
    productA(){};
    void show(){
        cout << "this is product A" << endl;
    }
};

// product B.
class productB : public product{
public:
    productB(){};
    void show(){
        cout << "this is product B" << endl;
    }
};

// product C.

// factory.
class factory{
private:
    product* product_;
public:
    factory(){}
    product* produce(string product){
        if (product == "productA"){
            this->product_ = new ProductA();
        } else {
            this->product_ = new ProductB();
        }
        return this->product_;
    }
};

int main(){
    factory* abstract_factory = new factory();
    product* product;
    product = abstract_factory("productA");
    // product = abstract_factory("productB");
    return 0;
}
```
# Strategy Pattern.
### what is strategy pattern.

### Example.
```
class SortStrategy{
public:
    virtual ~MapStrategy() {}
    virtual vector Doalgorithm(const vector<int> &data) const = 0;
};
class QuickSortStrategy : public SortStrategy{
public:
    vector<int> Doalgorithm(const vector<int> & data){
        vector<int> ans;
        // do quick sort algorithm.

        return ans;
    }
};
class MergeSortStrategy: public SortStrategy{
public:
    vector<int> Doalgorithm(const vector<int> & data){
        vector<int> ans;
        // do merge sort algorithm.

        return ans;
    }
}
// Context.
class Context{
private:
    SortStrategy *strategy;
public:
    Context(SortStrategy* str1 = nullptr){
        this->strategy = str1;
    }
    ~Context(){
        delete this->strategy;
    }
    void setStrategy(SortStrategy *strategy){
        delete this->strategy;
        this->startegy = strategy;
    }
    void display() const {
        cout << 
    }
};
int main(){
    Context *context = new Context(new QuickSortStrategy);
    context->display();
    context->setStrategy(new MergeSortStrategy);
    context->display();
    return 0;
}
```
# Chain of responsibility.
### what is it?

### example.
```
// Handler interface.
class Handler{
public:
    virtual bool handle(std::string request) = 0;
    virtual Handler* setnext(Handler* Handler) = 0;
};


// abstract handler.
class AbstractHandler : public Handler{
private:
    handler* next;
public:
    AbstractHandler(){};
    ~AbstractHandler(){};
    bool handle(std::string request){
        if (this->next){
            return this->next->handle(request);
        }
        return false;
    }
    Handler* setnext(Handler* handler){
        this->next = handler;
        return handler;
    }
    
}


// language handler
class LanguageHandler : public AbstractHandler{
public:
    bool handler(std::string request){
        // logic handler.
        // 1. English. return 1.
        // 2. Chinese.
        // 3. Cantanese.
        return false;
    }
};

class DestinationHandler : public Handler{
public:
    bool handler(std::string request){
        // destination logic.

        return false;
    }
};

class TicketHandler : public Handler{
public:
    bool handler(std::string request){

        return false;
    }
}
```
# Decorator 
```
// decorator
class Component{
public:
    virtual ~Component(){}
    virtual std::string Operation() const = 0;
};
class ConcreteComponent : public Component {
public:
    std::string Operation() const override{
        return "concreteComponent";
    }
};
class Decorator : public Component{
protected:
    Component* component_;
public:
    Decorator(Component* c):component_(c){};
    std::string Operation()const override{
        return component_->Operation();
    }
};
class DecoratorA : public Decorator{
public:
    DecoratorA(Component* c) : Decorator(c){};
    std::string Operation() override{
        return "Decorator " + Decorator::operation() << endl;
    }
};
```

# Command (Transaction)
### What is it.

### example.

# Abstract Factory.
it is a creational design pattern that lets you produce families of related objects without specifying their concrete classes.  
```
class Shoes{
public:
    virtual void shows() = 0;
    virtual ~Shoes(){}
}

class NikeShoes : public Shoes{
public:
    void shows(){
        cout << "this is nikeshoes" << endl;
    }

};
class clothes {
public:
    virtual void shows() = 0;
    virtual ~clothes(){}

};
class uniClothes : public Clothes {
public:
    void show(){
        cout << "this is uniclothes << endl;
    }
}
class AbstractFactory{
public:
    virtual AbstractProduct_t *CreateProduct() = 0;
    virtual ~AbstractFactory() {}
}

class ConcreteFactory : public AbstractFactory{
public:
    AbstractFactory *CreateProduct(){
        return new ConcreteFactory()
    }
}
```

