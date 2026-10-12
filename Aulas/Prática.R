# ==============================================================================
# ROTEIRO DE AULA PRÁTICA - LINGUAGEM R
# Data: 25/09
# Módulo 5: Tipos de Dados, Constantes e Variáveis
# Prof.(a): [Seu Nome]
# ==============================================================================

# ------------------------------------------------------------------------------
# PARTE 1: TIPOS BÁSICOS DE DADOS
# ------------------------------------------------------------------------------

# 1. Dados Numéricos (numeric: double vs integer)
num_real <- 4.5        
num_inteiro <- 4L      

# Verificando a classe (geral) e o tipo (detalhado)
class(num_real)        
typeof(num_real)      

class(num_inteiro)     
typeof(num_inteiro)    

# 2. Dados de Texto (character ou string)
# Todo texto no R DEVE estar entre aspas simples ou duplas!
nome <- "Maria Silva"
codigo <- "12345"

typeof(nome)           
typeof(codigo)         

# O que acontece se digitarmos texto sem aspas?
# Maria  -> O R busca um objeto chamado Maria e retorna erro "object 'Maria' not found"
nome <- Maria Silva


# 3. Números Complexos (complex)
comp <- 4 + 3i
class(comp)           

# 4. Dados Lógicos (logical / boolean)
# Devem ser escritos em MAIÚSCULAS! (TRUE ou FALSE)
ativo <- TRUE
bloqueado <- FALSE

class(ativo)           

# Testes de comparação geram valores lógicos:
10 > 5                 
20 == 15               


# ------------------------------------------------------------------------------
# PARTE 2: CONVERSÃO DE DADOS (COERÇÃO COM as.*)
# ------------------------------------------------------------------------------

# Converter inteiro para numérico/double
x_int <- 2L
typeof(x_int)                      
x_num <- as.numeric(x_int)
typeof(x_num)                      

# Converter número real para inteiro (trunca/corta as casas decimais)
as.integer(4.9)                   

# Converter caractere numérico para número
as.numeric("7.8")                  

# Converter número para caractere
as.character(26.8)                 

# Converter lógico para número
as.numeric(TRUE)                   
as.numeric(FALSE)                  

# Conversão inválida (Aviso de Coerção / Warning Message)
as.integer("aula_R")               # Gera aviso e resulta em NA (Not Available)


# ------------------------------------------------------------------------------
# PARTE 3: CONSTANTES, VARIÁVEIS E ATRIBUIÇÃO
# ------------------------------------------------------------------------------

# Atribuição recomendada no R: <-
nota_final <- 8.5

# Outras formas válidas de atribuição:
9.0 -> nota1
nota2 = 7.5
assign("nota3", 10)

# Verificando Case Sensitivity (O R diferencia maiúsculas de minúsculas)
nota.final <- 9
Nota.final <- 8

print(nota.final)                  
print(Nota.final)                  

# Testando Palavras Reservadas (Proibidas para nomes de variáveis)
# repeat <- 10                     
Repeat <- 10                       


# ------------------------------------------------------------------------------
# PARTE 4: GERENCIAMENTO DE MEMÓRIA (ls e rm)
# ------------------------------------------------------------------------------

# Listar todas as variáveis salvas na memória principal
ls()

# Remover uma variável específica
rm(nota1)
ls()                               # nota1 não estará mais presente

# Limpar TODAS as variáveis da memória (cuidado!)
rm(list = ls())
ls()                               # Retorna character(0) -> memória limpa!


# ------------------------------------------------------------------------------
# PARTE 5: ENTRADA MANUAL DE DADOS (cat e scan)
# ------------------------------------------------------------------------------

# Mensagem orientativa e leitura de um número inteiro via teclado
cat("Por favor, digite a sua idade: ")
idade <- scan(file = stdin(), n = 1, what = integer())

# Exibindo o valor informado pelo aluno
cat("Sua idade cadastrada foi:", idade, "\n")
