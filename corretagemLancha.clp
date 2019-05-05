 
(defglobal
?*g_resultado* = 0
)

; Em que nível se encontra a avaliacao do casco
(deftemplate casco
0 10 nota_casco
    ((ruim (z 0 3))
        (regular (3 0)(4 1)(5 0))
        (bom (4 0)(7 1)(8 0))
        (otimo (s 6 10))
    )
)

; Exemplo de plotagem dos graficos
; (plot-fuzzy-value t "obrz" 0 10 
;      (create-fuzzy-value casco otimo)
;      (create-fuzzy-value casco bom)
;      (create-fuzzy-value casco regular)
;      (create-fuzzy-value casco ruim)
; )

; Em que nível se encontra a avaliacao do motor
(deftemplate motor
0 10 nota_motor
     ((ruim (z 0 4))
        (regular (3 0)(5 1)(6 1)(7 0))
        (bom (5 0)(8 1)(9 0))
        (otimo (s 9 10))
    )
)

; Exemplo de plotagem dos graficos
; (plot-fuzzy-value t "obrz" 0 10 
;      (create-fuzzy-value motor otimo)
;      (create-fuzzy-value motor bom)
;      (create-fuzzy-value motor regular)
;      (create-fuzzy-value motor ruim)
; )

; Possiveis avaliações e seus valores em milhares
(deftemplate avaliacao
0 800 valorBarco
    ((ruim (z 0 400))
        (medio (350 0)(500 1)(550 1)(560 0))
        (bom (550 0)(630 1)(680 1)(790 0))
        (otimo (s 750 800))
    )
)

; Exemplo de plotagem dos graficos
; (plot-fuzzy-value t "rmbo" 0 800 
;      (create-fuzzy-value avaliacao ruim)
;      (create-fuzzy-value avaliacao medio)
;      (create-fuzzy-value avaliacao bom)
;      (create-fuzzy-value avaliacao otimo)
; )


; Regras

(defrule Otimo
    (declare (salience 10))
    (or 
     (and (casco otimo)
        (motor otimo))
     (and (casco regular)
        (motor otimo))
     (and (casco bom)
        (motor otimo)))    
=>
    (assert (avaliacao otimo))
)

(defrule Bom
    (declare (salience 10))
    (or (and (casco ruim)
        (motor otimo))
        (and (casco regular)
        (motor bom))
        (and (casco otimo)
        (motor ruim))
        (and (casco otimo)
        (motor bom))
        (and (casco bom)
        (motor bom))
        )
=>
    (assert (avaliacao bom))
)

(defrule Medio
    (declare (salience 10))
    (or (and (casco otimo)
        (motor ruim))
        (and (casco bom)
        (motor ruim))
        (and (casco regular)
        (motor regular))
        (and (casco otimo)
        (motor bom))
        (and (casco ruim)
        (motor bom))
        )
=>
    (assert (avaliacao medio))
)

(defrule Ruim
    (declare (salience 10))
    (or (and (casco regular)
        (motor ruim))
        (and (casco ruim)
        (motor ruim))
        (and (casco ruim)
        (motor regular))
    )
=>
    (assert (avaliacao ruim))
)

; Fim regras

; Defuzifica, a forma de conseguir os resultados.
(defrule defuzifica
    (declare (salience 0))
    ?v_tmp <- (avaliacao ?)
=>
    (bind ?*g_resultado* (moment-defuzzify ?v_tmp))
    (plot-fuzzy-value t "*" nil nil ?v_tmp)
    (retract ?v_tmp)
    (printout t "Valor recomendado: ")
    (printout t ?*g_resultado* )
    (printout t " mil reais" crlf)
    (printout t " >>> Término <<< " crlf)
)

; Slice indica a ordem que sera executado as regras, para dar certo a regra
; Defuzifica precisa ser executada por ultimo.

; Possiveis combinações de fatos

; (deffacts avaliacao
;     (casco otimo)
;     (motor otimo)
; )

; (deffacts avaliacao
;     (casco bom)
;     (motor otimo)
; )

; (deffacts avaliacao
;     (casco regular)
;     (motor otimo)
; )

; (deffacts avaliacao
;     (casco ruim)
;     (motor otimo)
; )

; (deffacts avaliacao
;     (casco otimo)
;     (motor bom)
; )

; (deffacts avaliacao
;     (casco bom)
;     (motor bom)
; )

; (deffacts avaliacao
;     (casco regular)
;     (motor bom)
; )

; (deffacts avaliacao
;     (casco ruim)
;     (motor bom)
; )

; (deffacts avaliacao
;     (casco otimo)
;     (motor regular)
; )

; (deffacts avaliacao
;     (casco bom)
;     (motor regular)
; )

; (deffacts avaliacao
;     (casco regular)
;     (motor regular)
; )

; (deffacts avaliacao
;     (casco ruim)
;     (motor regular)
; )

; (deffacts avaliacao
;     (casco otimo)
;     (motor ruim)
; )

; (deffacts avaliacao
;     (casco bom)
;     (motor ruim)
; )

; (deffacts avaliacao
;     (casco regular)
;     (motor ruim)
; )

; (deffacts avaliacao
;     (casco ruim)
;     (motor ruim)
; )
