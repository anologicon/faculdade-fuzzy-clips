
# <center> Implementação de um Sistema Especialista Fuzzy para Corretagem de valores da lancha Phanton 365 2015 </center>

## <center> Paulo Raimundi </center>

## 1. Introdução

 <p align="justify"> Neste relatório será detalhada a implementação de um Sistema Especialista Fuzzy utilizando a ferramenta FuzzyClips. A finalidade do sistema é fornecer o melhor valor para a corretagem de uma lancha Phanton 265 2015. Para o melhor resultado foi especificado o modelo e ano da lancha, pois de acordo com o modelo, marca, fabricante podem ter muitas variáveis que impactam nos valores finais. Os resultados finais são impactados de acordo com as condições do casco da lancha e a condição do motor. </p>

<p align="center"> As variáveis linguísticas de entrada e saída são mostradas na Tabela 1: </p>

<table class="tg">
  <tr>
    <th class="tg-0lax"></th>
    <th class="tg-wp8o" colspan="4">Casco</th>
  </tr>
  <tr>
    <td class="tg-wp8o">Motor</td>
    <td class="tg-mcqj">RUIM</td>
    <td class="tg-mcqj">REGULAR</td>
    <td class="tg-mcqj">BOM</td>
    <td class="tg-mcqj">ÓTIMO<br></td>
  </tr>
  <tr>
    <td class="tg-mqa1">RUIM</td>
    <td class="tg-wp8o">ruim</td>
    <td class="tg-wp8o">ruim</td>
    <td class="tg-wp8o">medio</td>
    <td class="tg-wp8o">medio</td>
  </tr>
  <tr>
    <td class="tg-mqa1">REGULAR</td>
    <td class="tg-wp8o">ruim</td>
    <td class="tg-wp8o">medio</td>
    <td class="tg-wp8o">medio</td>
    <td class="tg-wp8o">bom</td>
  </tr>
  <tr>
    <td class="tg-mqa1">BOM</td>
    <td class="tg-wp8o">medio</td>
    <td class="tg-wp8o">bom</td>
    <td class="tg-wp8o">bom</td>
    <td class="tg-wp8o">bom</td>
  </tr>
  <tr>
    <td class="tg-mqa1">ÓTIMO<br></td>
    <td class="tg-wp8o">bom</td>
    <td class="tg-wp8o">otimo</td>
    <td class="tg-wp8o">otimo</td>
    <td class="tg-wp8o">otimo</td>
  </tr>
</table>


<p align="center">Tabela 1. Variáveis linguísticas para o valor a ser considerado na corretagem.</p>

Na primeira coluna da tabela estão descritos os valores possíveis para a situação atual do motor, enquanto na primeira linha estão descritos os valores possíveis para a situação do casco  da lancha. Os demais valores da tabela são as possíveis avaliações da lancha, que será considerada no valor final da corretagem.

## 2. Implementação e Teste
Para cada variável linguística foi definido um template. No caso do template Casco, utilizou-se duas funções pré-definidas (z e s)  um dois triângulos:

```lisp
(deftemplate casco
0 10 nota_casco
    ((ruim (z 0 3))
        (regular (3 0)(4 1)(5 0))
        (bom (4 0)(7 1)(8 0))
        (otimo (s 6 10))
    )
)
```
O código ilustra os valores numéricos (notas) possíveis para a situação do Casco, considerando as variáveis linguísticas definidas na Tabela 1 e no template respectivo
