#lang racket
(require "funcmain.rkt")

;Lista de cores
(define cores (list "darkmagenta" "darkblue" "brown" "mediumvioletred" "hotpink" "darkgreen" "ivory" "darkolivegreen" "darkseagreen"
                    "darkturquoise" "dimgray" "firebrick" "goldenrod" "lightseagreen" "orange" "royalblue" "orchid" "limegreen" "indianred"
                    "lightgoldenrodyellow" "lawngreen" "darkcyan"))

;referente as figuras
(define (random-crt );funcao random para circulos retangulos e textos
(define x (list "c" "r" "t"))
(list-ref x(random 0 (length x))) )

(define (random-cr);funcao referente para circulos e retangulos
(define x (list "c" "r"))
(list-ref x(random 0 (length x))))

(define (random-string);funcao que escolhe dentre 3 strings 
(define x(list "Primeira String Teste" "Teste Segunda String" "String Teste Terceira"))
(list-ref x(random 0 (length x))))

;arruma os indices de todos os equipamentos urbanos
(define (indiceFunc)
  (begin
    (set! hcIndice(+ hcIndice 1))
    (cond
      [(> hcIndice quantTotalQuad) (set! hcIndice 1)])
    (set! xHid (+ xHid intervalo))
    (set! hDir(- hDir 1))
    (set! rcIndice(+ rcIndice 1))
    (cond
      [(> rcIndice quantTotalQuad) (set! rcIndice 1)])
    (set! xRadio(+ xRadio intervalo))
    (set! rDir(- rDir 1))
    (set! scIndice(+ scIndice 1))
    (cond
      [(> scIndice quantTotalQuad) (set! scIndice 1)])
    (set! xSema (+ xSema intervalo))
    (set! sDir(- sDir 1))
    (set! stringindice(+ stringindice 1))
    (cond
      [(> stringindice quantTotalQuad) (set! stringindice 1)])
    (set! xQuadra(+ xQuadra intervalo))
    (set! qDir(- qDir 1))
    )
  )

;desenha equipamentos urbanos
(define (funcWhile terminonf)
  
  (set! yInicio (Cond1 qDir yInicio intervalo))
  (set! xQuadra (Cond2 qDir xInicio xQuadra))
  (set! yQuadra (Cond3 qDir yInicio yQuadra))
  (set! qBaixo (Cond4 qDir qBaixo))
  (set! qDir (Cond5 qDir quantTotalQuad))
  (define insereQuadra (quadra ale qBaixo stringindice xQuadra yQuadra w h out))

  (set! yInicio1 (Cond1 hDir yInicio1 intervalo))
  (set! xHid (Cond2 hDir xInicio1 xHid))
  (set! yHid (Cond3 hDir yInicio1 yHid))
  (set! hlIndice (Cond4 hDir hlIndice))
  (set! hDir (Cond5 hDir quantTotalQuad))
  (define insereHid (hidrante hlIndice hcIndice xHid yHid out))

  (set! yInicio2 (Cond1 rDir yInicio2 intervalo))
  (set! xRadio (Cond2 rDir xInicio2 xRadio))
  (set! yRadio (Cond3 rDir yInicio2 yRadio))
  (set! rlIndice (Cond4 rDir rlIndice))
  (set! rDir (Cond5 rDir quantTotalQuad))
  (display (string-append "rb" " " "rbb0" (number->string rlIndice) "."
                          (number->string rcIndice) " " (number->string (+ xRadio 60)) " "
                          (number->string (+ yRadio 45))"\n") out)

  (set! yInicio3 (Cond1 sDir yInicio3 intervalo))
  (set! xSema (Cond2 sDir xInicio3 xSema))
  (set! ySema (Cond3 sDir yInicio3 ySema))
  (set! slIndice (Cond4 sDir slIndice))
  (set! sDir (Cond5 sDir quantTotalQuad))
  (display (string-append "s ""sfb0"(number->string slIndice)"."(number->string scIndice) " "
                          (number->string (+ xSema 135)) " " (number->string (+ ySema 10))"\n") out)

  (indiceFunc)
  (cond
    [(> terminonf 0) (funcWhile (- terminonf 1))]));volta para o inicio da funcao caso ainda existam quadras a serem printadas

;definindo quantidades
(printf "Digite a Quantidade de figuras: ")
(define totalFig (read-line (current-input-port) 'any))
(printf "Digite a o Tamanho do Bairro: ")
(define quantTotalQuad (read-line (current-input-port) 'any))
(printf "Digite a Quantidade de Predios: ")
(define  qPredios(read-line (current-input-port) 'any))

;transforma string em numeros
(set! totalFig (string->number totalFig))
(set! quantTotalQuad (string->number quantTotalQuad))
(set! qPredios (string->number qPredios))

;define i,nh,ns,nr,nq
(define i (- totalFig 10))
(define nh (* 4(* quantTotalQuad quantTotalQuad)))
(define ns (* quantTotalQuad quantTotalQuad)) 
(define nr (* quantTotalQuad quantTotalQuad))
(define nq (* quantTotalQuad quantTotalQuad))
;criando txt, cria um txt no diretorio escrito
(define out (open-output-file "/home/lucalliel/Desktop/TrabalhoRacket/saida/fileGeo1.geo"))

;define quantidade de predios e muros
(define np (* quantTotalQuad quantTotalQuad))
(define nm (* quantTotalQuad 1))

;sortei duas cores
(define cor1 (list-ref cores (random 0 (length cores))))
(define cor2 (list-ref cores (random 0 (length cores))))

;printa nx e comeco
(funComeco i nq nh ns nr np nm out cor1 cor2)

(define xFiguras (+ (* quantTotalQuad 60)(* quantTotalQuad 100)))
(define qDir (- quantTotalQuad 1));todas essas variaveis sao referentes as quadras, e como printalas no txt de forma adequada
(define cepIndice qDir)
(define qBaixo 1)
(define ale "q")
(define stringindice 1)
(define xQuadra 20);y da quadra
(define yQuadra 20);x da quadra
(define w 120);w
(define h 90) ;h
(define intervalo 150);é a distancia uma quadra da outra
(define xInicio 20);mudam a cada ciclo
(define yInicio 20)
(define xInicio1 20)
(define yInicio1 20)
(define xHid 20)
(define yHid 20)
(define hcIndice 1)
(define hlIndice 1)
(define quantHid (* 4 (* quantTotalQuad quantTotalQuad)))
(print quantHid)
(define hDir (- quantTotalQuad 1))
(define xInicio2 20)
(define yInicio2 20)
(define xRadio 20)
(define yRadio 20)
(define rcIndice 1)
(define rlIndice 1)
(define rDir (- quantTotalQuad 1))
(define quantRadio (* quantTotalQuad quantTotalQuad))
(define xInicio3 20)
(define yInicio3 20)
(define xSema 20)
(define ySema 20)
(define scIndice 1)
(define slIndice 1)
(define sDir (- quantTotalQuad 1))
(define quantSema (* quantTotalQuad quantTotalQuad))
(define terminonf (+ quantSema(+ quantRadio (+ quantHid nq))))
(print terminonf)


(cond
 [(> quantTotalQuad 0)(funcWhile terminonf)]); aki termina de fazer as Quadras

(define (random-nslo)
  (define face(list "n" "s" "l" "o"))
    (list-ref face(random 0 (length face))))

(define pDir (- quantTotalQuad 1));todas essas variaveis sao referentes as quadras, e como printalas no txt de forma adequada
(define prdIndice 1)
(define aleatorioQ1 (random 1 5))
(define aleatorioQ2 (random 1 5))
(define fPredio (random 30 45))
(define pPredio (random 35 70))
(define pMrg (random 10 20))
(define facePredio (random-nslo))

(define (funcWhile4 qPredios nq)
  (set! aleatorioQ1 (random 1 nq))
  (set! aleatorioQ2 (random 1 nq))
  (set! fPredio (random 30 45))
  (set! pPredio (random 35 70))
  (set! pMrg (random 10 20))
  (set! facePredio (random-nslo))
  (display (string-append "prd" " " "b0"(number->string aleatorioQ1)"."(number->string aleatorioQ2) " "
                          facePredio " " (number->string fPredio) " " (number->string pPredio) " "
                          (number->string pMrg) "\n") out)
  (cond
    [(> qPredios 1) (funcWhile4 (- qPredios 1) nq)]))

(define resultado4 (funcWhile4 qPredios nq))



(define stringale random-string)
(define aleFig (random-crt))
(define corFig1 "Blue")
(define corFig2 "Yellow")
(define indiceFig 0)
(define textCont 0)
(define xFig 30)
(define yFig xFiguras)
(define rFig 0)
(define wFig 0)
(define hFig 0)
;(define varsw random(1 3))
;(define varsw random(1 3))

(display (string-append "sw"  " "  (number->string 2)  " " (number->string 2) "\n")out)

(define (funcWhile2)
  (set! aleFig (random-crt))
  (set! stringale (random-string))
  (set! xFig (random 20 250));numero aleatorio para ponto no eixo x
  (set! yFig (random xFiguras (+ xFiguras 100)));ponto aleatorio para ponto no eixo y
  (set! rFig (random 50));numero aleatorio para o tamanho do raio
  (set! wFig (random 200));largura do retangulo
  (set! hFig (random 200));altura do retangulo
  (cond
    [(string=? "t" aleFig) (set! textCont(+ textCont 1))])
  (cond
    [ (> textCont 3) (set! aleFig (random-cr))])
  (cond
    [(string=? aleFig "c") (set! indiceFig(+ indiceFig 1))]
    [(string=? aleFig "r") (set! indiceFig(+ indiceFig 1))])
  (cond
    [(string=? aleFig "c") (set! totalFig(- totalFig 1))]
    [(string=? aleFig "r") (set! totalFig(- totalFig 1))])
  (cond
    [;primeira condição caso for um circulo printa (tipo (id)->ainda nao foi implementado r x y cor1 cor2), os outros seguem respectivamente a mesma ideia
     (string=? "c" aleFig) (display (string-append aleFig " " (number->string indiceFig) " "
                                                   (number->string rFig) " " (number->string xFig) " " (number->string yFig) " " corFig2 " " corFig1"\n") out)]
    
    [(string=? "r" aleFig) (display (string-append aleFig " " (number->string indiceFig) " "
                                                   (number->string wFig) " " (number->string hFig) " " (number->string xFig) " " (number->string yFig) " "
                                                   corFig1 " " corFig2"\n") out)]
    
    [(string=? "t" aleFig) (display (string-append aleFig " " (number->string xFig) " " (number->string yFig) " " stringale "\n") out)])
  (cond
    [(> totalFig 0) (funcWhile2 )]))
(cond
  [(> totalFig 0) (funcWhile2)])
;(define resultado2 (funcWhile2))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;torres de radio mesma logica das quadras, daqui em diante é seguir o que foi visto a cima
(close-output-port out)
  
