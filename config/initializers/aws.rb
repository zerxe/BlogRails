Aws.config.update({
                    region: 'eu-west-2',
                    credentials: Aws::Credentials.new(
                      Rails.application.credentials.aws[:access_key_id],
                      Rails.application.credentials.aws[:secret_access_key]
                    )
                  })
