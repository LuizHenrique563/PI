#include <stdio.h>
#include <string.h>

#define MAX_TENTATIVAS 3

void menu_inicial() {
    printf("======= Prontuário-Pro =======\n");
    printf("Selecione o tipo de usuário:\n");
    printf("1. Médico\n");
    printf("2. Paciente\n");
    printf("==============================\n");
}

int main() {
    int tipo_usuario;
    char cpf_crm[50];
    char senha[50];
    int tentativas = 0;

    // Login fictício para simulação
    const char usuario_medico[] = "123456CRM";
    const char senha_medico[] = "senha123";

    const char usuario_paciente[] = "12345678900";
    const char senha_paciente[] = "paciente1";

    while (1) {
        menu_inicial();
        printf("Digite a opção (1 ou 2): ");
        scanf("%d", &tipo_usuario);
        getchar(); // Limpar o buffer do teclado

        if (tipo_usuario != 1 && tipo_usuario != 2) {
            printf("Opção inválida! Tente novamente.\n\n");
            continue;
        }

        printf("CPF/CRM: ");
        fgets(cpf_crm, sizeof(cpf_crm), stdin);
        cpf_crm[strcspn(cpf_crm, "\n")] = '\0'; // Remover '\n'

        printf("Senha: ");
        fgets(senha, sizeof(senha), stdin);
        senha[strcspn(senha, "\n")] = '\0';

        int login_correto = 0;

        if (tipo_usuario == 1 && strcmp(cpf_crm, usuario_medico) == 0 && strcmp(senha, senha_medico) == 0) {
            login_correto = 1;
        } else if (tipo_usuario == 2 && strcmp(cpf_crm, usuario_paciente) == 0 && strcmp(senha, senha_paciente) == 0) {
            login_correto = 1;
        }

        if (login_correto) {
            printf("\nLogin realizado com sucesso!\n");
            break;
        } else {
            tentativas++;
            printf("Dados incorretos. Tentativas restantes: %d\n", MAX_TENTATIVAS - tentativas);

            if (tentativas >= MAX_TENTATIVAS) {
                char opcao;
                printf("\nVocê esqueceu sua senha? (s/n): ");
                scanf(" %c", &opcao);
                if (opcao == 's' || opcao == 'S') {
                    printf("Redirecionando para recuperação de senha...\n");
                } else {
                    printf("Encerrando o sistema.\n");
                }
                break;
            }
        }
    }

    return 0;
}
