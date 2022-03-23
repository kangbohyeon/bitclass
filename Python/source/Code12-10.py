class SuperClass :
    def  method(self) :
        raise NotImplementedError()

class SubClass (SuperClass) :
    pass

sub = SubClass()
sub.method()

