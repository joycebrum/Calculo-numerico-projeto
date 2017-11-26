function[ret, erro] = AproximacaoQuadNivel()//relacao linear da nota com o quadrado do nivel e com a taxa usando minimos quadrados
    //nota = a*nivel^2 + b*taxa + c 
    T = Entrada()//matriz do tipo [nivel, taxa, nota]
    N = size(T)
    n = N(1,1)
    A = zeros(n,3)
    b = zeros(n,1)
    for i=1:1:n
        A(i,1) = T(i,1)^2 //nivel^2 -- nivel socio economico
        A(i,2) = T(i,2) //taxa de aprovacao
        A(i,3) = 1
        b(i,1) = T(i,3)/10 //nota de 0 a 100
    end
    At = A'*A
    bt = A'*b
    ret = At\bt //resolve o sistema linear At*A*x = At*b ~~> A*x = b
    a = ret(1,1)
    b = ret(2,1)
    c = ret(3,1)
    //desenhar a funcao
    deff('z=f(x,y)','z=a*x^2+b*y+c')
    x=0:0.2:100 ;y = x ;
    clf();
    fplot3d(x,y,f,alpha=5,theta=31)
    erro = Erro(A, ret, b);
endfunction

function[nota] = preveNotaQuadNivel(ponto, coeficiente)//preve a nota de uma escola recebendo ponto = (nivel, taxa) e os coeficientes da funcao acima
    nota = coeficiente(1,1)*ponto(1,1)^2 + coeficiente(2,1)*ponto(2,1) + coeficiente(3,1)//calcula a nota
    if nota>100 then
        nota = 100
    end
    if nota < 0 then
        nota = 0
    end
endfunction


function[ret, erro] = AproximacaoQuadTaxa()//relacao linear da nota com o quadrado da taxa e com o nivel usando minimos quadrados
    //nota = a*nivel + b*taxa^2 + c 
    T = Entrada()
    N = size(T)
    n = N(1,1)
    A = zeros(n,3)
    b = zeros(n,1)
    for i=1:1:n
        A(i,1) = T(i,1) //nivel socio economico
        A(i,2) = T(i,2)^2 //taxa^2--taxa de aprovacao
        A(i,3) = 1
        b(i,1) = T(i,3)/10 //z--nota de 0 a 100 
    end
    At = A'*A
    bt = A'*b
    ret = At\bt
    a = ret(1,1)
    b = ret(2,1)
    c = ret(3,1)
    //desenhar a funcao
    deff('z=f(x,y)','z=a*x+b*y^2+c')
    x=0:0.2:100 ;y = x ;
    clf() ;fplot3d(x,y,f,alpha=5,theta=31)
    erro = Erro(A, ret, b);
endfunction

function[nota] = preveNotaQuadTaxa(ponto, y)//preve a nota de uma escola recebendo ponto = (nivel, taxa) e os coeficientes da funcao acima
    nota = y(1,1)*ponto(1,1) + y(2,1)*ponto(2,1)^2 + y(3,1)
    if nota>100 then
        nota = 100
    end
    if nota < 0 then
        nota = 0
    end
endfunction

function[ret, erro] = AproximacaoQuadratica()//relacao linear da nota com o quadrado da taxa e com o quadrado do nivel usando minimos quadrados
    //z = ax^2 + by^2 + c x=nivel y=resenca z=nota
    T = Entrada()
    N = size(T)
    n = N(1,1)
    A = zeros(n,3)
    b = zeros(n,1)
    for i=1:1:n
        A(i,1) = T(i,1)^2 //x^2 -- nivel socio economico
        A(i,2) = T(i,2)^2 //y^2--taxa de aprovacao
        A(i,3) = 1
        b(i,1) = T(i,3)/10 //z--nota de 0 a 100
    end
    At = A'*A
    bt = A'*b
    ret = At\bt
    a = ret(1,1)
    b = ret(2,1)
    c = ret(3,1)
    //desenhar a funcao
    deff('z=f(x,y)','z=a*x^2+b*y^2+c')
    x=0:0.2:100 ;y = x ;
    clf() ;fplot3d(x,y,f,alpha=5,theta=31)
    erro = Erro(A, ret, b);
endfunction
function[nota] = preveNotaQuad(ponto, coeficiente)//relacao linear da nota com o quadrado do nivel e com a taxa usando minimos quadrados
    nota = coeficiente(1,1)*ponto(1,1)^2 + coeficiente(2,1)*ponto(2,1)^2 + coeficiente(3,1)
    if nota>100 then
        nota = 100
    end
    if nota < 0 then
        nota = 0
    end
endfunction
