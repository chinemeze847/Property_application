module Api
    module V1
        class PropertiesController < ApplicationController

            def index
                with_validated_params(FetchPropertiesContract.new) do |params|

                    begin
                        properties = PropertyManager::PropertyReader.call(params)

                        handle_response({
                            "success" => true,
                            "data" => properties
                        }, "successfully fetched all matching properties.")

                    rescue
                        handle_response({"internal_error" => true})
                    end
                end
            end


            def create 

                with_validated_params(CreatePropertyContract.new) do |params|

                    begin

                        property_response = PropertyManager::PropertyCreator.call(params)

                        handle_response(property_response, "Property created successfully.")
                
                    rescue
                        handle_response({"internal_error" => true})
                    end
                end

            end


            def update

                with_validated_params(UpdatePropertyContract.new) do |params|
                    begin
                        property_response = PropertyManager::PropertyUpdater.call(params)

                        handle_response(property_response, "successfully updated property with id = #{params[:id]}.")

                    rescue
                        handle_response({"internal_error" => true})
                    end
                end
            
            end


            private

            def with_validated_params(schema)
                result = schema.call(params.to_unsafe_hash)
            
                if result.success?
                  yield result.to_h
                else
                    render json: {status: "failed", message: "Request unsuccessful.", error: result.errors.to_h}, status: :bad_request
                end
            end

            def handle_response(response, message="")
            
                if response["success"]
                    render json: {status: "success", message: message, data: response["data"]}, status: :ok
                elsif response["internal_error"]
                    render json: {status: "error", message: "Something went wrong. Please try again later.", errors: "Something went wrong. Please try again later."},status: :internal_server_error
                else
                    render json: {status: "failed", message: response["message"], errors: response["errors"]}, status: :bad_request
                end
            end
        end
    end
end
