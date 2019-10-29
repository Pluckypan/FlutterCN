Dart 语言概述
===

## 官方说明
> Dart is a client-optimized language for fast apps on any platform,made by Google. Dart 是一种 易于学习、 易于扩展、并且可以部署到 任何地方 的 应用 编程 语言。Google 使用 Dart 来开发 大型应用。

- [dart官网](https://dart.dev/) | https://www.dartlang.org/
- [dart中文网](http://dart.goodev.org/)
- [dartdoc.cn](http://www.dartdoc.cn/)
- [在线运行](https://dartpad.dartlang.org/)

## 简介
Dart（/dɑ:t/）是一种适用于万维网的开放源代码编程语言，由Google主导开发，于2011年10月公开。它的开发团队由Google Chrome浏览器V8引擎团队的领导者拉尔斯·巴克主持，目标在于成为下一代结构化Web开发语言。类似JavaScript，Dart也是一种面向对象语言，但是它采用基于类编程。它只允许单一继承，语法风格接近C语言。[wiki](https://zh.wikipedia.org/wiki/Dart)

它可用于web、服务器、移动应用和物联网等领域的开发。它是宽松开源许可证（BSD证书）下的开源软件。Dart是一种强类型、跨平台(DartVM)的开发语言

## 语言特性
1. 面向对象的：万物皆对象;哪怕是数字类型、方法甚至null都是对象，所有的对象都是继承自Object
2. 强类型语言：但变量类型是可选,因为Dart可以自动推断变量类型 `var` & `dynamic`
3. 支持范型：`List<int>` 表示一个整型的数据列表；`List<dynamic>` 则是一个对象的列表，其中可以装任意对象
4. Dart没有public protected private等关键字,如果某个变量以下划线 `_` 开头，代表这个变量在库中是私有的
5. 类的级联运算符 `...`
6. 其他：单继承、支持接口、混入 mixins、抽象类、枚举 enum
7. 编译时只保留运行时需要调用的代码(不允许反射这样的隐式引用)

## 数据类型
1. 整数和小数 Numbers: `int a = 1;` `double b = 1.1;` 在 `Flutter` 中有定义 `Float` 等 `NativeType`
2. 字符串 Strings: `var a="hello";` `String b="world";`
3. 布尔类型 Booleans: `var a=false;` `bool b=true;`
4. 数组 Arrays:
  - `var nums = [1, 2, 3, 4, 5];`
  - `List<String> words = ['hello', 'world', "sra", "sofia"];`
  - `List<dynamic> mixs = [1, true, 'Mira', 1.0];`
5. 集合 Set:
    ```
    var set = new Set();
    set.add("hello");
    set.add("world");
    ```
6. 键值对 Map:
  ```
  var map = {"a": 1, "b": 2, "c": 3, "d": 4, "e": 5};
  Iterable allKey = map.keys;
  Set keys = allKey.toSet();
  Set values = map.values.toSet();
  ```
7. Symbol: `dart:mirrors` 包中提供了特定的类 `print(#s == new Symbol("s"));// true` [链接](http://1t.click/aAYX)  

## 运算符
1. 与 `Java` 一致的运算符
  ```
  int a = 1;
  ++a;
  a++;
  var b = 1;
  print(a == b);  // false
  print(a * b); // 3
  bool real = false;
  real ? print('real') : print('not real'); // not real
  print(real && a == b); // false
  print(real || a == 3); // true
  print(a != 2); // true
  print(a <= b); // false
  var c = 9;
  c += 10;
  print("c = $c"); // c = 19
  print(1<<2); // 4
  ```
2. 与 `Java` 不一样的地方
  - `is` & `is!` 类型判断
  - `~/` 取整
  - `as` 强制类型转换
  - `??=` 运算符前面的变量为null，则赋值，否则不赋值
  - `?.` 空指针检查
  - `??` `A??B`
  - `...` 对象的级联运算符

3. 验证代码
  ```
  class Person {
    eat() {
      print("I am eating...");
    }

    sleep() {
      print("I am sleeping...");
    }

    study() {
      print("I am studying...");
    }
  }
  var s = "hello";
  print(s is String); // true
  var num = 6;
  print(num is! String); // true

  int k = 1;
  int j = 2;
  print(k / j); // 0.5
  print(k ~/ j); // 0
  print(k % j);// 1

  (peter as Person).teach();

  var hello = "hello", world = null;
  hello ??= "world";
  world ??= "world";
  print("$hello $world"); // hello world

  var first = "hello world";
  var second = null;
  print(first.length); // 11
  print(second?.length); // null
  print(second.length); // 报错

  new Person()..eat()..sleep()..study();
  ```

## 控制流程
1. if else
  ```
  int score = 80;
  if (score < 60) {
    print("so bad!");
  } else if (score >= 60 && score < 80) {
    print("just so so!");
  } else if (score >= 80) {
    print("good job!");
  }
  ```
2. switch
  ```
  String a = "hello";
  switch (a) {
    case "hello":
      print("hi.");
      break;
    case "world":
      print("cause you are the world.");
      break;
    default:
      print("bye bye.");
  }
  ```
3. for
  ```
  List<String> list = ["a", "b", "c"];
  for (int i = 0; i < list.length; i++) {
    print(list[i]);
  }
  for (var i in list) {
    print(i);
  }
  list.forEach((item) => print(item));
  ```
4. while
  ```
  int i=0;
  while(i<100){
    i++;
    print(i);
  }
  int j = 0;
  do {
    j++;
    print(j);
  } while (j < 100);  
  ```
5. try catch
  ```
  try {
    var a;
    var b=10;
    print(a ~/ b);
  } catch(e){
    print(e);// NoSuchMethodError
  }
  ```
6. try catch finally
  ```
  try {
    var a;
    var b=10;
    print(a ~/ b);
  }on NoSuchMethodError {
    print("error");
  } finally {
    print("finally");
  }
  ```
## 数组相关方法
- forEach() `students.forEach((student) => print(student));`
- map `students.map((student) => 'Hello ' + student['name']).toList();`
- contains() `nums.contains(5);`
- sort() `numbers.sort((num1, num2) => num1 - num2);`
- reduce() `var sum = numbers.reduce((curr, next) => curr + next);`
- fold() `numbers.fold(10, (curr, next) => curr + next);`
- every() 用于判断数组中的每一项是否均达到了某个条件
  `var isAgeOver20 = students.every((student) => student["age"] > 20);`
- where() 返回数组中满足给定条件的元素集合
  `students.where((student) => student["age"] > 16).toList();`
- firstWhere() 返回数组中满足给定条件的第一个元素
  `students.firstWhere((student) => student["age"] > 16, orElse: () => null);`
- singleWhere() 返回数组中满足给定条件的唯一一个元素，若有多个元素满足条件会抛出异常
  `students.singleWhere((student) => student["age"] < 16, orElse: () => null);`
- take(n) 从数组里取 n 个元素
- skip(n) 跳过数组中的 n 个元素
- List.from() 克隆一个数组
- expand()
  ```
  var arr1 = [[2, 5], [7], [11, 12]];
  var flattened = arr1.expand((item) => item).toList();
  print(flattened);
  // [2, 5, 7, 11, 12]

  var arr2 = [2, 5, 8];
  var computed = arr2.expand((item) => [item * 8]).toList();
  print(computed);
  // [16, 40, 64]

  // 当对每一项进行计算时类似于 map()
  var computed2 = arr2.map((item) => item * 8).toList();
  print(computed2);
  // [16, 40, 64]  
  ```

## 变量
- 定义变量
  ```
  var a = 1;
  int b = 10;
  String s = "hello";
  dynamic c = 0.5;
  ```
- 默认值：没有赋初值的变量都会有默认值 `null`
- `final` 只可赋值一次 `final a=1;`
- `const` 常量：`const girl="sofia";`

## 函数
- Dart是一个面向对象的编程语言，所以即使是函数也是一个对象，也有一种类型Function，这就意味着函数可以赋值给某个变量或者作为参数传给另外的函数。所有的函数都有返回值，如果没有指定return语句，那么该函数的返回值为null。
- 定义函数
  ```
  /// 普通版
  int add(int a,int b){
    return a + b;
  }

  /// 精简版
  add(int a,int b) => a + b;

  /// 命名参数 不传参也可运行
  sayHi({name:String}){
    print("Hi,my name is $name.")
  }

  /// 命名参数 @required 标识该方法一定要传参
  sayHi({@required String name}){
    print("Hi,my name is $name.")
  }

  /// 位置参数
  sayHello(String name, int age, [String hobby, bool rich]) {
    StringBuffer sb = new StringBuffer();
    sb.write("hello, this is $name and I am $age years old");
    if (hobby != null) {
      sb.write(", my hobby is $hobby");
    }
    if (rich != null && rich) {
      sb.write(", I am rich.");
    }
    print(sb.toString());
  }
  /// 命名参数的默认值
  add({int a,int b=5}) => a + b;
  /// 无法编译
  plus({a:int,b:int=5}) => a + b;

  /// 位置参数的默认值
  int sum(int a, int b, [int c = 3]) {
    return a + b + c;
  }

  // 函数作为对象
  printLine(item) {
    print("item=$item");
  }

  // callback 匿名函数
  printItem(int c,callback){
    callback(add(a:c));
  }

  /// 不论在Dart还是Flutter中，必须都需要一个顶层的main()函数，它是整个应用的入口函数
  main() {
    sayHi(name:"Plucky");// Hi,my name is Plucky.
    sayHi();// Hi,my name is null.
    sayHello("py", 1);// hello, this is py and I am 1 years old
    sayHello("py", 1, "basketball");// hello, this is py and I am 1 years old, my hobby is basketball
    sayHello("py", 1, "basketball", true);// hello, this is py and I am 1 years old, my hobby is basketball, I am rich.

    var arr = [1, 2, 3];
    // 把函数当对象
    arr.forEach(printLine);
    // 函数赋值给变量
    var fn = (item) => print("fn item=$item");
    arr.forEach(fn);
    // 匿名函数(或者说接口)
    arr.forEach((item) => printItem(item,(param)=>{
      print(param)
    }));
    /// 内部函数
    int innerFunc(int a,int b){
      return a+b;
    }
    print(innerFunc(1,2));
  }
  ```

## 类
1. Dart中的类没有访问控制
2. 构造方法：经典方式
  ```
  class Person {
    String name;
    int age;
    String gender;
    Person(String name,int age,String gender){
       this.name = name;
       this.age = age;
       this.gender = gender;
    }

    sayHello() {
      print("hello, this is $name, I am $age years old, I am a $gender");
    }
  }
  ```
3. 构造方法：Dart 简洁构造方式
    ```
    class Person {
      String name;
      int age;
      String gender;

      Person(this.name, this.age, this.gender);

      Person.obtain(){
        this.name="Plucky";
        this.age=20;
        this.gender="male";
      }

      sayHello() {
        print("hello, this is $name, I am $age years old, I am a $gender");
      }      
    }
    ```  
4. 继承
  ```
  class Human {
    int time;
    String name;

    Human.obtain(int time) {
      this.time = time;
      name = "Adam";
    }

    born() {
      return "$name born at $time";
    }

  }

  class Man extends Human {
    int gender;

    Man.obtain(int time) : super.obtain(time) {
      this.gender = 1;
    }
    _genderTo() {
      return gender == 1 ? "male" : "famale";
    }

    hi() {
      print("${born()},i am ${_genderTo()}");
    }
  }
  ```  
5. `setter` & `getter`    
  ```
  class Rectangle {
    num left, top, width, height;

    Rectangle(this.left, this.top, this.width, this.height);

    num get right => left + width;
    set right(num value) => left = value - width;

    num get bottom => top + height;
    set bottom(num value) => top = value - height;
  }
  ```
6. 抽象类与抽象方法
  ```
  abstract class Car {
    run();
  }

  class Bench extends Car {
    run() {
      print("run away...");
    }
  }  
  ```
7. 运算符重载
  ```
  class Vector {
    num x, y;
    Vector(this.x, this.y);
    Vector operator +(Vector v) => new Vector(x + v.x, y + v.y);
    Vector operator -(Vector v) => new Vector(x - v.x, y - v.y);
    printVec() {
      print("x: $x, y: $y");
    }
  }

  main() {
    Vector v1 = new Vector(1, 2);
    Vector v2 = new Vector(3, 4);
    (v1 - v2).printVec(); // -2, -2
    (v1 + v2).printVec(); // 4, 6
  }
  ```
8. 枚举
  ```
  enum Color { red, green, blue }
  print(Color.red.index);// 0
  ```
9. mixins
  ```
  class Tom {
    playPiano() {
      print("I am good at piano.");
    }
  }

  class Jerry {
    playComputer() {
      print("I am good at computer.");
    }
  }

  class Tony = Tom with Jerry;

  main() {
    var tony = new Tony();
    tony.playPiano();
    tony.playComputer();
  }
  ```
10. 静态变量和静态方法  
  ```
  class Cons {
    static const name = "Tom";
    static sayHello() {
      print("hello, this is ${Cons.name}");
    }
  }

  main() {
    Cons.sayHello(); // hello, this is tom
    print(Cons.name); // tom
  }  
  ```

## 接口
```
typedef void CartChangedCallback(Product product, bool inCart);
```

## 泛型
```
class AnyBody<T> {
  void generic(T t) {
    print("generic:${t}");
  }
}

main() {
  var iBody = new AnyBody<int>();
  iBody.generic(1);// generic:1
  var sBody = new AnyBody<String>();
  sBody.generic("Nicole.");// generic:Nicole.
}
```

## 注释
注释规范 [点这里](http://1t.click/aAYB)
```
//  单行文本:灰色

/// 单行文本:彩色

/**
 *  多行文本
 */
```

## 导包
- 官方标准包 `import 'dart:io';`
- 第三方类库 `import 'package:flutter/material.dart';`
- 自己开发包 `import './md5.dart';`
- 使用别名 `import './md5.dart' as md5;` 则使用时需要加上 `md5.` 前缀.目的是为了解决 `import` 冲突
- 只导入 `import 'package:lib/lib.dart' show foo;` 表示只使用 `foo`
- 不导入 `import 'package:lib/lib.dart' hide foo;` 表示排除掉 `foo`
- **懒加载** `import 'package:greetings/hello.dart' deferred as hello;`

## 异步
Dart 提供了类似 ES7 中的 `async` `await` 等异步操作，这种异步操作在 `Flutter` 开发中会经常遇到，比如网络或其他IO操作;`async` 和 `await` 往往是成对出现的，如果一个方法中有耗时的操作，你需要将这个方法设置成 `async`，并给其中的耗时操作加上 `await` 关键字，如果这个方法有返回值，你需要将返回值塞到 `Future` 中并返回，如下代码所示：
```
import 'dart:async';
import 'package:http/http.dart' as http;

Future<String> parseHtml() async{
  http.Response res = await http.get("http://1991th.com");
  return res.body;
}

main() {
  parseHtml().then((str) {
    print(str);
  });
}
```
