require 'httparty'

module Exotel
    class SmsApi
        include HTTParty
        base_uri "https://twilix.exotel.in"

        class << self
            attr_reader :id, :token, :has_all_fields

            # <b>Expects</b>
            # * sid => your exotel sid 
            # * token => your exotel token 
            def set_credentials(sid, token)
                @sid = sid
                @token = token
                basic_auth @sid, @token
            end

            # <b>Checks for following for all required fields have been passed</b>
            # * <b>input[:From]</b> <em>Hash</em> - Contains sender Id
            # * <b>input[:To]</b> <em>Hash</em> - number of recipient
            # * <b>input[:Body]</b> <em>Hash</em> - message body 
            def has_fields_for_sending_sms(input)
                @has_fields = false
                if input.is_a? Hash
                    @has_fields = true if [:From , :To , :Body ].all? {|field| input.has_key? field} or \
                                          ["From", "To", "Body"].all? {|field| input.has_key? field}
                end
            end

            # <b>Expects input hash having</b>
            # * <b>input[:From]</b> <em>Hash</em> - Contains sender Id
            # * <b>input[:To]</b> <em>Hash</em> - number of recipient
            # * <b>input[:Body]</b> <em>Hash</em> - message body 
            #
            # <b>Returns</b>
            # * Hash{}: Hash containing api response 
            def send_sms(input)
                has_fields_for_sending_sms(input)
                raise ArgumentError if ! @has_fields
                options = {:body => input}
                path = "/v1/Accounts/%s/Sms/send" % [@sid]
                response = post(path, options)
                return response["TwilioResponse"]["SMSMessage"]
            end

            # <b>Checks if all required fields have been passed</b>
            #
            # <b>Expects input hash having</b>
            # * either <b>input[:sms_sid]</b> <em>Hash</em> - Hash containing sms_sid 
            # * or <b>input["sms_sid"]</b> <em>Hash</em> - Hash containing sms_sid 
            # * or <b>sms_sid</b> <em>(String)</em> - String having sms_sid 
            def has_sid_for_checking_sms_status(input)
                @has_sms_sid = false
                if input.is_a? Hash
                    @sms_sid = input[:sms_sid] === nil ? input[:sms_sid] : input["sms_sid"]
                    @has_sms_sid = true if [:sms_sid ].all? {|field| input.has_key? field} or \
                                           ["sms_sid"].all? {|field| input.has_key? field}
                elsif input.is_a? String                    
                    @sms_sid = input
                    @has_sms_sid = true
                end
            end

            # <b>Expects</b>
            # * either <b>input[:sms_sid]</b> <em>Hash</em> - Hash containing sms_sid 
            # * or <b>input["sms_sid"]</b> <em>Hash</em> - Hash containing sms_sid 
            # * or <b>sms_sid</b> <em>(String)</em> - String having sms_sid 
            #
            # <b>Returns</b>
            # * Hash{}: Hash containing api response 
            def check_sms_status(input)
                has_sid_for_checking_sms_status(input)
                raise ArgumentError if ! @has_sms_sid
                path = "/v1/Accounts/%s/SMS/Messages/%s" % [@sid, @sms_sid]
                response = get(path)
                return response["TwilioResponse"]["SMSMessage"]
            end
        end
    end
end
