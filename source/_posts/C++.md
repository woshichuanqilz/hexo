title: C++
date: 2016-01-06 19:00:24
tags: 
---
# My Cpp 

## STL

### Popup will not return value.
<!--more-->
For the reason that the `pop` operation is a `del`, what will you do after you del the item? nothing!
and if you want the get the pointer or sth else from a item which already been deleted, that means you should malloc a space to store the value , and the value should be freed by the programmer. It sounds weird and tedious  

so normally you should use the pop like this: get the value what will be poped out.
![02~01_14-48-25.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~01_14-48-25.png)

### Priority_queue , Heap
After make_heap a vector will popup the most value 
After sort_heap the vector will be ordered.
```cpp
// range heap example
#include <iostream>     // std::cout
#include <algorithm>    // std::make_heap, std::pop_heap, std::push_heap, std::sort_heap
#include <vector>       // std::vector

int main () {
  int myints[] = {10,20,30,5,15};
  std::vector<int> v(myints,myints+5);

  std::make_heap (v.begin(),v.end());
  std::cout << "initial max heap   : " << v.front() << '\n';

  std::pop_heap (v.begin(),v.end()); v.pop_back();
  std::cout << "max heap after pop : " << v.front() << '\n';

  v.push_back(99); std::push_heap (v.begin(),v.end());
  std::cout << "max heap after push: " << v.front() << '\n';

  std::sort_heap (v.begin(),v.end());

  std::cout << "final sorted range :";
  for (unsigned i=0; i<v.size(); i++)
    std::cout << ' ' << v[i];

  std::cout << '\n';

  return 0;
}
```

### Random Access Iterator
Random-access iterators are iterators that can be used to access elements at an arbitrary offset position relative to the element they point to, offering the same functionality as pointers.

[Iterator](http://hi.csdn.net/attachment/201010/15/88111_1287135922VF32.gif)
