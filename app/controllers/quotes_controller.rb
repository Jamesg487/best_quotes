class QuotesController < Rulers::Controller
  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :obj => quote, :ua => ua
  end

  def new_quote
    attrs = {
    "submitter" => "web user",
    "quote" => "A picture is worth one k pixels",
    "attribution" => "Me"
    }

    m = FileModel.create attrs
    render :quote, :obj => m
  end

  def update
    raise "must be post request" unless env["REQUEST_METHOD"] == "POST"

    quote = FileModel.find(params["id"])

    quote[params["attribute_to_update"]] = params["attribute_value"]

    File.open("db/quotes/#{params["id"]}.json", "w") do |f|
      f.write <<-TEMPLATE
        {
        "submitter": "#{quote["submitter"]}",
        "quote": "#{quote["quote"]}",
        "attribution": "#{quote["attribution"]}"
        }
      TEMPLATE
    end
  end

  def a_quote
    render :a_quote, :noun => :winking
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def exception
    raise "It's a bad one!"
  end
end