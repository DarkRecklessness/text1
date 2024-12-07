#align(center)[#text(size: 15pt)[= Функции и классы-друзья]]
#v(2em)

*Функции и классы-друзья* - такие функции или классы, которые хоть и не являются членами данного класса, тем не менее им разрешен доступ к приватной части данного класса, такое отношение *не симметрично и не транзитивно*.

```cpp
#include <iostream>

class C {
private:
    int x{5};
public:
    void f(int y) {
        std::cout << x + y;
    }

    friend void g(C, int);
    friend class CC;
};

void g(C c, int y) {
    std::cout << c.x + y + 1;
}

int main() {
    C c;
    std::cout << (int&)c;
}
```

*```cpp friend```* - специальное ключевое слово, можно объявлять где угодно в классе, независимо от *private или public* (можно также и определить в классе, в данном случае было бы *error: redefinition*, соответсвенно можно определять отдельно в классе, но не рекомендуется).

*Принцип работы*: слово, которое говорит компилятору запомнить эту функцию, и когда будет определение этой функции, то ей разрешено обращение к приватным полям (анаголично и *классы*).

*```cpp friend```* функции можно объявлять только после определения класса, иначе будут неизвестны поля класса и это не имеет смысла.

Если хотим подружить 2 класса, то у одного из них надо заранее определить поля, методы, using и тд. 

*```cpp friend```* не стоит использовать часто, скорее исключение из правил.

#align(center)[#text(size: 15pt)[= Конструкторы и деструкторы (ctor / dtor)]]

