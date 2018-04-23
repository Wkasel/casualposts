class EmailProcessor
  require 'sendgrid-ruby'
  include SendGrid

  def initialize(email)
    @email = email
  end

  def process
    Rails.logger.info "RECEVIED EMAIL"
    Rails.logger.debug @email
    # from = Email.new(email: @email)
    # to = Email.new(email: 'william@casualposts.com')
    # subject = 'Sending with SendGrid is Fun'
    # content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    # mail = Mail.new(from, subject, to, content)
    #
    # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    # response = sg.client.mail._('send').post(request_body: mail.to_json)
    # puts response.status_code
    # puts response.body
    # puts response.parsed_body
    # puts response.headers


    data = JSON.parse('{
      "personalizations": [
        {
          "to": [
            {
              "email": "william@casualposts.com"
            }
          ],
          "subject": "Reply For Post"
        }
      ],
      "from": {
        "email": "no-reply@reply.casualposts.com"
      },
      "content": [
        {
          "type": "text/plain",
          "value": "and easy to do anywhere, even with Ruby"
        }
      ]
    }')

    # curl -X "POST" "https://api.sendgrid.com/v3/mail/send" -H "Authorization: Bearer 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" -H "Content-Type: application/json" -d '{ "personalizations": [ { "to": [ { "email": "william@casualposts.com" } ], "subject": "Sending with SendGrid is Fun" } ], "from": { "email": "no-reply@reply.casualposts.com" }, "content": [ { "type": "text/plain", "value": "and easy to do anywhere, even with Ruby" } ] }'

    sg = SendGrid::API.new(api_key: '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')
    # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._("send").post(request_body: data)
    puts response.status_code
    puts response.body
    puts response.parsed_body
    puts response.headers
  end
end
