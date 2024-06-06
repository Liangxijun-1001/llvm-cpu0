class C { bits<5> V; }

def X : C {
    let V = 31;
    code c=[{ return true; }];
}

def Y : C {
	string Greeting;
    dag unsignedFlag = (?);
}

class D : C { let V = 0; }
def Z : D;