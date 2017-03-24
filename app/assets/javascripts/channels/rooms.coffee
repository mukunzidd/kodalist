jQuery(document).on 'turbolinks:load', ->
  chat_messages = $('#chat_messages')
  if $('#chat_messages').length > 0
    chat_messages_to_bottom = -> chat_messages.scrollTop(chat_messages.prop("scrollHeight"))

    chat_messages_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "ChatRoomsChannel"
        chat_room_id: chat_messages.data('chat-room-id')
      },
      connected: ->
        stream_from "chat_rooms_#{params['chat_room_id']}_channel"

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        chat_messages.append data['chat_message']
        chat_messages_to_bottom()

      send_chat_message: (chat_message, chat_room_id) ->
        @perform 'send_chat_message', chat_message: chat_message, chat_room_id: chat_room_id


    $('#new_chat_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#chat_message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_chat_message textarea.val(), chat_messages.data('chat-room-id')
        textarea.val('')
      e.preventDefault()
      return false