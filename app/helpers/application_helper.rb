module ApplicationHelper
    def serialize_collection(model, data = {}, params = {})
        (Object.const_get model + 'Serializer')
          .new(data, params: params).serializable_hash[:data].map { |record| record[:attributes] }
    end
    def serialize_record(model, data = {}, params = {})
        (Object.const_get model + 'Serializer')
            .new(data, params: params).serializable_hash[:data][:attributes]
    end
end
