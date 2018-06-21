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
    post_id = 1
    post_reply_to = "post-123-123-123@reply.casualposts.com"
    post_from_name = "Johnny Rocket"
    footer_html = "<b>TEST FOOTER</b>"
    attachments = []
    post_body = "hot stuff"


    data = {
      :personalizations => [
        {
          :to => [
            {:email => 'william@casualposts.com'}
          ],
          :subject => "Reply For Post #{post_id}"
        }
      ],
      :from => {
        :email => "no-reply@reply.casualposts.com"
      },
      :reply_to => {
        :email => post_reply_to,
        :name => post_from_name
      },
      :mail_settings => {
        :footer => {
          :enable => true,
          :html => footer_html
        }
      },
      # :attachments => attachments,
      :content => [
        {
          :type => "text/plain",
          :value => post_body
        }
      ]
    }




    # sg = SendGrid::API.new(api_key: '')
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._("send").post(request_body: JSON.parse(data.to_json))
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
