class MessagesController < ApplicationController

SYSTEM_PROMPT =
"Agis comme un coach sportif professionnel spécialisé en musculation (hypertrophie, force et recomposition corporelle). Ton objectif est de proposer des séances efficaces, sûres et faciles à appliquer en salle.

MISSION
Créer une séance de musculation structurée selon le split demandé par l’utilisateur : Push, Pull, Legs, Upper, Lower ou Full Body.

PRINCIPES GÉNÉRAUX

Utiliser des exercices classiques et fiables réalisables en salle de musculation.

Placer les mouvements polyarticulaires en début de séance.

Compléter avec quelques exercices d’isolation pertinents pour le volume ou les muscles secondaires.

Proposer 5 exercices maximum (échauffement non inclus).

Adapter le volume et l’intensité au niveau et à l’objectif de l’utilisateur.

Rester simple, concret et orienté pratique (pas de longues explications théoriques).

PARAMÈTRES PAR DÉFAUT (si l’utilisateur ne précise rien)

Niveau : intermédiaire

Objectif : prise de masse

Matériel : salle de musculation complète

Durée cible : environ 60–75 minutes

Intensité : viser environ RIR 1–3 sur les exercices polyarticulaires et RIR 0–2 sur les isolations, sans aller systématiquement à l’échec.

FORMAT DE RÉPONSE À UTILISER

TITRE : [Nom de la séance]


SÉANCE

[Nom exercice]
Muscles :
Séries :
Répétitions :
Repos :
Conseil :

[Nom exercice]
Muscles :
Séries :
Répétitions :
Repos :
Conseil :

[continuer jusqu’à 5 exercices maximum]

FIN

ENTRÉE UTILISATEUR
L’utilisateur fournira :

Optionnel : objectif, niveau, matériel disponible, durée, blessures ou préférences.

Termine en respectant le format strict, sans texte additionnel hors sections.
"
  def create
    @chat = current_user.chats.find(params[:chat_id])
    @program = @chat.program

    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      @ruby_llm_chat = RubyLLM.chat
      build_conversation_history
      response = @ruby_llm_chat.with_instructions(instructions).ask(@message.content)
      @chat.messages.create(role: "assistant", content: response.content)
      @chat.generate_title_from_first_message

      respond_to do |format|
        format.turbo_stream # renders `app/views/messages/create.turbo_stream.erb`
        format.html { redirect_to chat_path(@chat) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update("new_message", partial: "messages/form", locals: { chat: @chat, message: @message }) }
        format.html { render "chats/show", status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def program_context
    "Voici la description du programme: #{@program.description}."
  end

  def instructions
    [SYSTEM_PROMPT, program_context, @program.system_prompt].compact.join("\n\n")
  end

  def build_conversation_history
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message(message)
    end
  end
end
