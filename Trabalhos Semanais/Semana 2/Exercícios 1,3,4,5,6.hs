-- Exercício 1
duplicar :: Int->Int
duplicar x = x * 2

quadruple :: Int->Int
quadruple x = duplicar (duplicar x)

hipotenuse :: Float->Float->Float
hipotenuse a b = sqrt(a**2 + b**2)

distancia :: Float->Float->Float->Float->Float
distancia x1 y1 x2 y2 = sqrt((x1-x2)**2 + (y1-y2)**2)

-- Exercício 3
conversao::Float->(Float,Float,Float)
conversao x = (x, x/3.96, x/4.45)

-- Exercício 4
bissexto::Int->Bool
bissexto x
    | mod x 400 == 0 = True
    | (mod x 4 == 0) && (mod x 100 /= 0) = True
    | otherwise = False

-- Exercício 5
type Data = (Int, Int, Int)
-- Datas inválidas devem retornar False na função bissexto2, pois se uma data não é válida, não faz
-- sentido afirmar que essa data está presente em um ano bissexto
valida::Data->Bool
valida (d,m,a)
    | d >= 1 && d <= 31 && (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) = True
    | d >= 1 && d <= 30 && (m == 4 || m == 6 || m == 9 || m == 1) = True
    | d >= 1 && d <= 28 && m == 2 && not (bissexto a) = True
    | d >= 1 && d <= 29 && m == 2 && bissexto a = True
    | otherwise = False

bissexto2::Data->Bool
bissexto2 (d,m,a) = valida(d,m,a) && bissexto a

-- Exercício 6
-- Feito no exercício 5 com a função "valida"

-- Exercício 7
precede::Data->Data->Bool
precede (d1,m1,a1) (d2,m2,a2)
    | not (valida (d1,m1,a1)) || not (valida (d2,m2,a2)) = False
    | a2 > a1 = True
    | a2 == a1 && m2 > m1 = True
    | a2 == a1 && m2 == m1 && d2 > d1 = True
    | otherwise = False

-- Exercício 8
type Livro = (String, String, String, String, Int)
type Aluno = (String, String, String, String)
type Emprestimo = (String, String, Data, Data, String)

-- Exercício 9
emprestimoEmDia::Emprestimo->Data->Bool
emprestimoEmDia (cl, ca, de, dd, sit) (d,m,a) = valida (d,m,a) && precede (d,m,a) dd