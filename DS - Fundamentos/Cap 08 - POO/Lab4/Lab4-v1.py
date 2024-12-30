# Hangman Game (Jogo da Forca) 
# Programação Orientada a Objetos

# Imports necessários
import random  # Para escolher uma palavra aleatória
from os import system, name  # Para limpar a tela do terminal (diferente para Windows e Mac/Linux)

# Função para limpar a tela a cada execução
def limpa_tela():
    # Verifica se o sistema operacional é Windows
    if name == 'nt':
        _ = system('cls')  # Comando para limpar a tela no Windows
    # Caso seja Mac ou Linux
    else:
        _ = system('clear')  # Comando para limpar a tela em sistemas Unix

# Tabuleiro do jogo (Imagens da forca)
board = [
    '''
    >>>>>>>>>>>Hangman<<<<<<<<<<
    +---+
    |   |
        |
        |
        |
        |
    ========''',
    '''
    +---+
    |   |
    O   |
        |
        |
        |
    ========''',
    '''
    +---+
    |   |
    O   |
    |   |
        |
        |
    ========''',
    '''
    +---+
    |   |
    O   |
   /|   |
        |
        |
    ========''',
    '''
    +---+
    |   |
    O   |
   /|\  |
        |
        |
    ========''',
    '''
    +---+
    |   |
    O   |
   /|\  |
   /    |
        |
    ========''',
    '''
    +---+
    |   |
    O   |
   /|\  |
   / \  |
        |
    ========'''']

# Classe principal do jogo Hangman
class Hangman:

    # Método Construtor
    def __init__(self, palavra):
        self.palavra = palavra  # Palavra secreta do jogo
        self.letras_erradas = []  # Lista para armazenar as letras erradas
        self.letras_escolhidas = []  # Lista para armazenar as letras corretas

    # Método para adivinhar a letra
    def guess(self, letra):
        # Se a letra estiver na palavra e não foi escolhida antes
        if letra in self.palavra and letra not in self.letras_escolhidas:
            self.letras_escolhidas.append(letra)  # Adiciona a letra correta

        # Se a letra não estiver na palavra e não foi errada antes
        elif letra not in self.palavra and letra not in self.letras_erradas:
            self.letras_erradas.append(letra)  # Adiciona a letra errada

        # Se a letra já foi escolhida, retorna False
        else:
            return False

        return True

    # Método para verificar se o jogo terminou
    def hangman_over(self):
        # O jogo termina se o jogador venceu ou se errou 6 vezes
        return self.hangman_won() or (len(self.letras_erradas) == 6)

    # Método para verificar se o jogador venceu
    def hangman_won(self):
        # Se não houver mais '_' na palavra oculta, o jogador venceu
        if '_' not in self.hide_palavra():
            return True
        return False

    # Método para ocultar a palavra, mostrando as letras acertadas e '_' para as erradas
    def hide_palavra(self):
        rtn = ''
        for letra in self.palavra:
            if letra not in self.letras_escolhidas:
                rtn += '_'
            else:
                rtn += letra
        return rtn

    # Método para checar o status do jogo e imprimir o tabuleiro
    def print_game_status(self):
        # Imprime o tabuleiro com base no número de letras erradas
        print(board[len(self.letras_erradas)])

        # Imprime a palavra com as letras acertadas
        print('\nPalavra: ' + self.hide_palavra())

        # Imprime as letras erradas
        print('\nLetras erradas: ',)
        for letra in self.letras_erradas:
            print(letra,)

        # Imprime as letras corretas
        print()
        print('Letras corretas: ',)
        for letra in self.letras_escolhidas:
            print(letra,)

        print()

# Função para escolher uma palavra aleatória
def rand_palavra():
    # Lista de palavras para o jogo
    palavras = ['banana', 'abacate', 'uva', 'morango', 'laranja']
    # Escolhe uma palavra aleatória
    palavra = random.choice(palavras)
    return palavra

# Função principal do jogo
def main():
    limpa_tela()  # Limpa a tela antes de começar o jogo

    # Cria o objeto Hangman e escolhe uma palavra aleatória
    game = Hangman(rand_palavra())

    # Enquanto o jogo não terminar
    while not game.hangman_over():
        game.print_game_status()  # Exibe o status do jogo

        # Recebe a letra do jogador
        user_input = input('\nDigite uma letra: ')

        # Verifica se a letra digitada faz parte da palavra
        game.guess(user_input)

    # Exibe o status final do jogo
    game.print_game_status()

    # Se o jogador venceu, imprime a mensagem de vitória
    if game.hangman_won():
        print('\nParabéns! Você venceu!!')

    # Se o jogador perdeu, imprime a mensagem de derrota
    else:
        print('\nGame over! Você perdeu.')
        print('A palavra era ' + game.palavra)

    # Mensagem final
    print('\nFoi bom jogar com você! Agora vá estudar!\n')

# Executa o programa
if __name__ == "__main__":
    main()