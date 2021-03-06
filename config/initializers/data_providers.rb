DataProvider.register :billogram,
                      BillogramDataProvider,
                      username: Rails.application.secrets.billogram_username,
                      password: Rails.application.secrets.billogram_password

DataProvider.register :'github/pull_requests',
                      GithubDataProvider::PullRequestCount,
                      token: Rails.application.secrets.github_token

DataProvider.register :front,
                      FrontDataProvider,
                      token: Rails.application.secrets.front_token

DataProvider.register :not_found,
                      NotFoundDataProvider,
                      cache: Rails.cache
