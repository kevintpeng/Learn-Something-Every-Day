#!/usr/bin/env ruby

class Converter
  require 'pandoc-ruby'
  require 'nokogiri'

  @@footer = <<-HTML
    <div id="footer">
      Notes by <a href="https://github.com/kevintpeng">Kevin Peng</a>, former intern at Riot Games, Bloomberg, Apple and Shopify.<br>
      Connect with me on <a href="https://www.linkedin.com/in/kevintpeng/">LinkedIn</a>.
    </div>
  HTML

  def walk(path)
    Dir.foreach(path) do |child|
      next if child.start_with?("..")
      full_path = File.join(path, child)
      if File.directory?(full_path)
        write_index_page(full_path)
        walk(full_path) unless child.start_with?(".")
      elsif File.extname(full_path) == ".md"
        write_page(full_path)
      end
    end
  end

  def write_page(path)
    output_path = File.join(File.dirname(path), File.basename(path, ".md")) + ".html"
    contents = File.read(path)
    page = Nokogiri::HTML(
      PandocRuby
        .new(contents, :standalone, from: "markdown_github+tex_math_dollars")
        .to_html(
          :no_wrap,
          :table_of_contents,
          :mathjax,
          tab_stop: 2,
          css: "/style.css"
        )
    )
    process_page!(page, path)

    File.write(output_path, page.to_html)
  end

  def process_page!(page, path)
    body = page.css("body").first
    head = page.css("head").first

    return unless body

    page.css("title").first&.unlink
    title = page.css("h1").first
    if title && head
      head.add_child(Nokogiri::HTML.fragment(
        <<-HTML
          <title>#{title.text}</title>
        HTML
      ))
    end

    toc = page.css("#TOC").first
    if title && toc

      # Remove heading 1 from ToC
      list = page.css("#TOC > ul").first
      sublist = page.css("#TOC > ul > li > ul").first
      if list && sublist
        list.unlink
        toc.add_child(sublist)
      end

      # Move ToC to be after heading 1
      toc.unlink

      title.add_next_sibling(toc) if sublist

      title.add_next_sibling(Nokogiri::HTML.fragment(
        <<-HTML
          <a href="index.html">Back to #{title_for_path(File.dirname(path))}</a>
        HTML
      ))
    end

    body.add_child(Nokogiri::HTML.fragment(@@footer))
  end

  def write_index_page(path)
    output_path = File.join(path, "index.html")
    File.write(
      output_path,
      <<-HTML
        <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
          <meta http-equiv="Content-Style-Type" content="text/css">
          <meta name="generator" content="pandoc">
          <title>#{title_for_path(path)} - Kevin Peng Learn Something Every Day</title>
          <style type="text/css">code{white-space: pre;}</style>
          <link rel="stylesheet" href="/style.css" type="text/css">
        </head>
        <body>
          <h1>#{title_for_path(path)}</h1>
          #{
            unless path == "./."
              "<p><a href='../index.html'>Back</a></p>"
            else
              ""
            end
          }
          <ul>
          #{
            Dir.entries(path).select{|f| File.directory?(File.join(path, f)) && !f.start_with?(".") && !f.include?("vendor")}.map{|f|
            "<li><a href='#{f}/index.html'>#{f}</a></li>"
            }.join("\n")
          }
          #{
            Dir.entries(path).select{|f| f.end_with?(".md")}.map{|f|
              "<li><a href='#{File.join(File.dirname(f), File.basename(f, ".md")) + ".html"}'>#{f}</a></li>"
            }.join("\n")
          }
          </ul>
          #{@@footer}
        </body>
        </html>
      HTML
    )
  end

  def title_for_path(path)
    return "Learn Something Every Day" if path == "./."

    match = /^(\.\/)?(.+?)(\/.)?$/.match(path)
    return match[2]
  end

  def convert
    walk(".")
  end
end

Converter.new.convert
