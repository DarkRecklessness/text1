=== Пример
```cpp 
#include <iostream>

class C {
private:
    class Inner {
    public:
        int x = 1;
    private:
        int y = 2;
    };
public:
    Inner f() {
        return Inner();
    }
};
int main() {
    C c;
    std::cout << c.f().x; // CE or 1?
}
```
Хороший пример на понимание модификаторов доступа.

Будет 1, так как приватность запрещает именно называть *Inner* и обращатсья к нему, но если мы уже имеем объект, то можем с ним работать не обращая внимания на приватность класса *C*, можно так же сохранить его через *auto*.
#v(1em)

=== Пример
```cpp
#include <iostream>

class C {
private:
    void f(int) {
        std::cout << 1;
    }
public:
    void f(float) {
        std::cout << 2;
    }
};

int main() {
    C c;
    c.f(1); // CE or 2?
    c.f(1.0); // CE or 2?
}
```

В первом случае будет *CE*, так как это помогает проектированию классов, по задумке автора - неправильно вызывать ```cpp f(int)```, но ```cpp f(float)``` можно. Фактически мы показываем с какими аргументами можно вызываться, а с какими нельзя.

Во втором случае тоже будет *CE*, так как мы вызываемся от ```cpp double```, нет разницы сконвертировать в *int или float* - это равнозначные конверсии, неоднозначная перегрузка - CE.