# ==============================================================================
# AULA: MATRIZES EM R (Foco no seu tópico)
# ==============================================================================

# --- 1. O que é uma matriz? ---
# É um vetor com duas dimensões: linhas e colunas.
# Todos os elementos precisam ser do MESMO tipo (numérico, character, etc).


# --- 2. Criando matrizes ---

# Forma 1: preenchimento por COLUNA (padrão do R)
m1 <- matrix(1:6, nrow = 2, ncol = 3)
m1
# Resultado: coluna 1 = 1,2 | coluna 2 = 3,4 | coluna 3 = 5,6

# Forma 2: preenchimento por LINHA (byrow = TRUE)
m2 <- matrix(1:6, nrow = 2, ncol = 3, byrow = TRUE)
m2
# Resultado: linha 1 = 1,2,3 | linha 2 = 4,5,6

# Usando vetores já existentes
notas <- c(7, 8, 9, 6, 5, 10)
m_notas <- matrix(notas, nrow = 2, ncol = 3, byrow = TRUE)
m_notas

# Dando nomes às linhas e colunas
rownames(m_notas) <- c("Ana", "Bruno")
colnames(m_notas) <- c("Prova1", "Prova2", "Prova3")
m_notas


# --- 3. Verificando dimensões ---
dim(m_notas)   # retorna (n_linhas, n_colunas)
nrow(m_notas)  # número de linhas
ncol(m_notas)  # número de colunas
length(m_notas) # total de elementos


# --- 4. Indexação: acessando elementos ---
# Sintaxe: m[linha, coluna]

m_notas[1, 2]     # Linha 1, Coluna 2 -> nota do Bruno? Não: Ana na Prova2
m_notas[2, ]      # Linha 2 inteira (todas as notas do Bruno)
m_notas[, 3]      # Coluna 3 inteira (todas as notas da Prova3)

# Indexação com nomes
m_notas["Ana", "Prova1"]
m_notas["Bruno", ]


# --- 5. Modificando valores ---
m_notas[2, 2] <- 7.5   # Corrigindo a nota do Bruno na Prova2
m_notas


# --- 6. Adicionando linhas e colunas (rbind e cbind) ---

# Nova aluna
nova_linha <- c(10, 9, 8)
m_notas <- rbind(m_notas, "Carla" = nova_linha)
m_notas

# Nova prova (coluna)
nova_coluna <- c(6, 7, 9)
m_notas <- cbind(m_notas, "Prova4" = nova_coluna)
m_notas


# --- 7. Operações com matrizes ---

A <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2)
B <- matrix(c(2, 0, 1, 2), nrow = 2, ncol = 2)

A + B         # Soma elemento a elemento
A - B         # Subtração elemento a elemento
A * B         # Multiplicação ELEMENTO A ELEMENTO (não é matricial!)
A / B         # Divisão elemento a elemento

# Multiplicação MATRICIAL de verdade: usa %*%
A %*% B

# Transposta
t(A)

# Determinante e inversa (bônus, se quiser impressionar)
det(A)
solve(A)


# --- 8. Funções de agregação por linha/coluna ---

rowSums(m_notas)    # Soma de cada linha (total por aluno)
colSums(m_notas)    # Soma de cada coluna (total por prova)
rowMeans(m_notas)   # Média de cada aluno
colMeans(m_notas)   # Média de cada prova


# --- 9. Filtros lógicos em matrizes ---
# Quais notas são maiores ou iguais a 8?
m_notas >= 8

# Retorna apenas os valores que atendem à condição
m_notas[m_notas >= 8]

# Substituir valores reprovados por 0
m_notas[m_notas < 7] <- 0
m_notas

# ==============================================================================
# PARTE 3: LISTAS — QUANDO A MATRIZ NÃO BASTA
# ==============================================================================

# --- 3.1 Por que listas? ---
# Matriz: todos os elementos são do MESMO tipo.
# Lista: cada elemento pode ser de um tipo DIFERENTE (vetor, matriz, texto, etc).

# Exemplo motivador: quero guardar dados de uma turma
turma <- list(
  nome        = "Estatística 2024",
  alunos      = c("Ana", "Bruno", "Carla"),
  notas       = m_notas,           # <- reaproveita a matriz que criamos!
  media_geral = mean(m_notas),
  aprovados   = rowSums(m_notas) >= 20
)

turma


# --- 3.2 Acessando elementos da lista ---

# Com $ (mais legível)
turma$nome
turma$notas

# Com [[ ]] (por posição)
turma[[2]]

# Com [ ] (retorna uma SUBLISTA, cuidado!)
turma[2]


# --- 3.3 Navegando: lista + matriz juntas ---

# Nota da Ana na Prova1, dentro da lista
turma$notas["Ana", "Prova1"]

# Média de cada aluno guardada na lista
turma$aprovados


# --- 3.4 Adicionando e removendo elementos ---

turma$semestre <- 2024          # adiciona
turma$media_geral <- NULL       # remove
names(turma)                    # quais campos existem?
length(turma)                   # quantos campos?


# -------------------------------------------------------------------------


# ==============================================================================
# EXERCÍCIO INTEGRADOR: VETOR + MATRIZ + LISTA
# Tema: Boletim de uma turma
# ==============================================================================

# --- PARTE A: VETOR ---
# 1. Crie um vetor chamado `alunos` com os nomes:
#    "Ana", "Bruno", "Carla", "Diego"

# 2. Crie um vetor `disciplinas` com:
#    "Matemática", "Português", "História"

# 3. Descubra quantos alunos existem usando length()


# --- PARTE B: MATRIZ ---
# 4. Crie uma matriz `notas` com 4 linhas (alunos) e 3 colunas (disciplinas),
#    preenchendo por LINHA com os seguintes valores:
#    Ana:    8, 7, 9
#    Bruno:  6, 5, 7
#    Carla: 10, 9, 8
#    Diego:  4, 6, 5

# 5. Dê nomes às linhas (alunos) e às colunas (disciplinas) usando
#    rownames() e colnames()

# 6. Mostre apenas as notas da Carla.

# 7. Mostre apenas as notas de Matemática (a primeira coluna).

# 8. Calcule a MÉDIA de cada aluno com rowMeans().

# 9. Calcule a MÉDIA de cada disciplina com colMeans().


# --- PARTE C: LISTA ---
# 10. Crie uma lista chamada `boletim` contendo:
#     - titulo     = "Boletim 2024"
#     - alunos     = o vetor criado na Parte A
#     - disciplinas = o vetor criado na Parte A
#     - notas      = a matriz criada na Parte B
#     - media_alunos = o resultado de rowMeans(notas)

# 11. Acesse o campo `titulo` da lista.

# 12. Acesse a nota do Bruno em História, navegando pela lista.

# 13. Adicione um novo campo à lista chamado `aprovados`,
#     que seja TRUE para alunos com média >= 7 e FALSE caso contrário.

# 14. Use o campo `aprovados` para mostrar APENAS os nomes
#     dos alunos aprovados.
#     Dica: boletim$alunos[boletim$aprovados]
