class DeletePostJob < ApplicationJob
  queue_as :default

  discard_on ActiveJob::DeserializationError
  def perform(post)
    post.destroy
  end
end
