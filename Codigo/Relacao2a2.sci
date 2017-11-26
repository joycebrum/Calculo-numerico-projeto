//relacao em 1d entre :
//nivel e nota
//taxa e nota
function[ret, erro] = RelacaoNivelNota()//estabelece uma relacao linear entre o nivel e a nota usando minimos quadrados
    //nota = a*nivel + b
    T = Entrada()
    N = size(T)
    n = N(1,1)//numero de linhas da matriz T
    A = zeros(n,2)
    b = zeros(n,1)
    for i=1:1:n
        A(i,1) = T(i,1)//nivel
        A(i,2) = 1
        b(i,1) = T(i,3)/10//nota de 0 a 100
    end
    At = A'*A
    bt = A'*b
    ret = At\bt
    a = ret(1,1)
    b = ret(2,1)
    //desenhar a funcao
    deff("[y]=f(x)","y= a*x + b")
    x=[0:0.1:100];
    fplot2d(x,f)
    erro = Erro(A, ret, b);
endfunction

function[ret, erro] = RelacaoTaxaNota()//estabelece uma relação linear entre taxa e nota usando minimos quadrados
    //nota = a*taxa + b
    T = Entrada()
    N = size(T)
    n = N(1,1)//numero de linhas da matriz T
    A = zeros(n,2)
    b = zeros(n,1)
    for i=1:1:n
        A(i,1) = T(i,2)//taxa de aprovacao
        A(i,2) = 1
        b(i,1) = T(i,3)/10//nota de 0 a 100
    end
    At = A'*A
    bt = A'*b
    ret = At\bt
    a = ret(1,1)
    b = ret(2,1)
    //desenhar a funcao
    deff("[y]=f(x)","y= a*x + b")
    x=[0:0.1:100];
    fplot2d(x,f)
    erro = Erro(A, ret, b);
endfunction
function[nota] = preveNota(ponto, y)//recebe um ponto do tipo (nivel socio-economico ou taxa de aprovação) e o vetor retornado em Aproximacao Linear e retonar a Nota possivel
    nota = y(1,1)*ponto(1,1) + y(2,1)//calculo serve tanto para  a RelacaoTaxaNota quanto para a RelacaoNivelNota
    if nota>100 then
        nota = 100
    end
    if nota < 0 then
        nota = 0
    end
endfunction
