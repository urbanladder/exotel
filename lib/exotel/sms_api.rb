require 'httparty'

module Exotel
  class SmsApi < Auth

      # <b>Checks for following for all required fields have been passed</b>
      # * <b>input[:From]</b> <em>Hash</em> - Contains sender Id
      # * <b>input[:To]</b> <em>Hash</em> - number of recipient
      # * <b>input[:Body]</b> <em>Hash</em> - message body 
      #
      def self.has_fields_for_sending_sms(input)
        @has_fields = false
        keys_alternatives = [[:From , :To , :Body ], ["From", "To", "Body"]]
        if input.is_a? Hash
          keys_alternatives.each do |alternative|
            @has_fields = true if alternative.all? {|field| input.has_key? field}
          end
        end
        raise ArgumentError, "Accepts [From, To, Body] keys in same notation" if ! @has_fields
      end

      # <b>Expects input hash having</b>
      # * <b>input[:From]</b> <em>Hash</em> - Contains sender Id
      # * <b>input[:To]</b> <em>Hash</em> - number of recipient
      # * <b>input[:Body]</b> <em>Hash</em> - message body 
      #
      # <b>Returns</b>
      # * Hash{}: Hash containing api response 
      #
      def self.send_sms(input)
        has_fields_for_sending_sms(input)
        options = {:body => input}
        path = "/v1/Accounts/%s/Sms/send" % [@sid]
        response = post(path, options)
        return response["TwilioResponse"]["SMSMessage"]
      end

      # <b>Checks if all required fields have been passed</b>
      #
      # <b>Expects input hash having</b>
      # * either <b>input[:Sid]</b> <em>Hash</em> - the response hash containing sms_sid by key Sid 
      # * or <b>sms_sid</b> <em>(String)</em> - String having sms_sid 
      #
      def self.has_sid_for_checking_sms_status(input)
        @has_sms_sid = false
        if input.is_a? Hash
          @sms_sid = input["Sid"]
          @has_sms_sid = true if @sms_sid != nil 
        elsif input.is_a? String          
          @sms_sid = input
          @has_sms_sid = true
        end
        raise ArgumentError, "Accepts Sid as string or a hash with [Sid] key"  if ! @has_sms_sid
      end

      # <b>Expects</b>
      # * either <b>input[:Sid]</b> <em>Hash</em> - the response hash containing sms_sid by key Sid 
      # * or <b>sms_sid</b> <em>(String)</em> - String having sms_sid 
      #
      # <b>Returns</b>
      # * Hash{}: Hash containing api response 
      #
      def self.check_sms_status(input)
        has_sid_for_checking_sms_status(input)
        path = "/v1/Accounts/%s/SMS/Messages/%s" % [@sid, @sms_sid]
        response = get(path)
        return response["TwilioResponse"]["SMSMessage"]
      end
  end
end
