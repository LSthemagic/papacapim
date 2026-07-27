# Desenvolvimento Mobile: Projeto Papacapim

# Parte 1: Design da interface

| Status | Item | Descrição | Pontos |
|:------:|------|-----------|:------:|
| - [x] | **Tela de login** | Tela com campos de login e senha para acessar a rede. | **1,0** |
| - [x] | **Tela de cadastro** | Tela com campos de nome, login, senha e confirmação de senha para cadastrar. | **1,0** |
| - [x] | **Tela de feed** | Tela com as postagens, separadas entre postagens dos perfis que o usuário segue e outras que o back-end envia. | **1,0** |
| - [x] | **Tela de busca** | Tela para buscar posts (conteúdo do post) e usuários (pelo login). | **1,0** |
| - [x] | **Tela de perfil de usuário** | Tela com foto do usuário, nome, login, número de pessoas que segue, número de seguidores, botão para editar perfil (caso seja o próprio usuário) e botão para seguir/deixar de seguir (deve funcionar também para outros usuários). | **1,0** |
| - [x] | **Tela de alteração de dados do usuário** | Tela com campos de nome e senha para alteração, botão para alterar foto de perfil e botão para excluir perfil. | **1,0** |
| - [x] | **UI de seleção de foto da galeria para o perfil** | Interface para selecionar uma foto da galeria do celular. | **1,0** |
| - [x] | **UI de tirar foto do perfil com a câmera** | Interface para tirar uma foto com a câmera e utilizá-la como foto de perfil. | **1,0** |
| - [x] | **Tela de postagem** | Tela com um campo de texto para escrever a postagem e botão de enviar. | **1,0** |
| - [x] | **Botão de curtir e descurtir post** | Botão para curtir/descurtir uma postagem no feed. | **0,4** |
| - [x] | **Botão de responder post** | Botão no post do feed para escrever uma resposta em forma de post. | **0,3** |
| - [x] | **Botão de excluir post** | Botão para excluir postagem, disponível apenas nos posts do próprio usuário. | **0,3** |

---

## Análise Detalhada — Frontend/UI

### ✅ Completos

| Item | Arquivo | O que funciona |
|:-----|:--------|:---------------|
| **Tela de login** | `lib/features/auth/login.dart` | Campos de login e senha renderizados. Botão "Entrar" navega para a Home. Link "Criar conta" navega para o cadastro. |
| **Tela de cadastro** | `lib/features/auth/register.dart` | Campos de nome, login, senha e confirmar senha. Botão "Cadastrar" navega para a Home. |
| **Tela de feed** | `lib/features/home/home.dart` | "Todos" (3 posts) e "Seguindo" (1 post) alternam quantidade de posts exibidos. |
| **Tela de busca** | `lib/features/search/search.dart` | Campo de busca filtra resultados em tempo real — digitar "maria" mostra cards, texto diferente esconde. |
| **Tela de perfil de usuário** | `lib/features/profile/profile.dart` | Avatar, nome, login, seguidores/seguindo, botão Editar (próprio), botão Seguir (outros), posts do perfil. |
| **Tela de alteração de dados** | `lib/features/profile/edit_profile.dart` | Campos de nome/username/senha. Botão "Alterar foto" com opções Galeria/Câmera. "Salvar" volta com SnackBar. "Excluir" com confirmação → tela de login. |
| **Tela de postagem** | `lib/features/post/post.dart` | Campo de texto (280 chars). Botão "Publicar" volta pra Home com SnackBar. |
| **Curtir/descurtir** | `lib/components/post_card.dart` | Ícone de coração alterna entre vazio/cinza e preenchido/vermelho. Contagem sobe/desce. |
| **Responder post** | `lib/features/post/details.dart` | Campo de resposta + botão "Enviar". Digita, envia, limpa o campo e mostra SnackBar. |
| **Excluir post** | `lib/components/post_card.dart` + `lib/features/profile/profile.dart` | Ícone de lixeira no canto (só visible com `isAuthor`). Diálogo de confirmação → remove o card + SnackBar. |
| **UI de seleção de foto da galeria** | `lib/features/profile/edit_profile.dart` | `image_picker` integrado. Botão "Galeria" → `ImagePicker().pickImage(source: ImageSource.gallery)`. Foto exibida no `CircleAvatar` com `backgroundImage`. |
| **UI de tirar foto com a câmera** | `lib/features/profile/edit_profile.dart` | `image_picker` integrado. Botão "Câmera" → `ImagePicker().pickImage(source: ImageSource.camera)`. Foto exibida no `CircleAvatar`. |

### Resumo de pontos

| Status | Pontos |
|:-------|:------:|
| ✅ **Completos** | **10,0** — todos os 12 itens implementados |
| **Total** | **10,0** |
