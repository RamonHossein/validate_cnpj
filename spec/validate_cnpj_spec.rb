require 'spec_helper'
require 'fake_company/company'

describe ValidateCnpj do
  before :each do
    allow(I18n).to receive(:t).with("errors.messages.this_document_is_invalid").and_return("This document is invalid")
  end

  context "invalid document" do
    context "Menssage error" do
      it "pattern 'This document is invalid'" do
        company = Company.new(cnpj: "56.462.192/0004-04")

        company.valid?
        expect(company.errors[:cnpj]).to eq ["This document is invalid"]
      end

      it "customized 'new message'" do
        company = CompanyCustomized.new(cnpj: "56.462.192/0004-04")

        company.valid?
        expect(company.errors[:cnpj]).to eq ["new message"]
      end
    end

    context "format is invalid" do
      it "regex" do
        company = CompanyCustomized.new(cnpj: "33.532.758/0001-200")
        expect(company.valid?).to be_falsey

        company = CompanyCustomized.new(cnpj: "33.532.758/001-20")
        expect(company.valid?).to be_falsey

        company = CompanyCustomized.new(cnpj: "33.532.758/001-020")
        expect(company.valid?).to be_falsey
      end

      it "blacklist" do
        company = CompanyCustomized.new(cnpj: "55.555.555/5555-55")
        expect(company.valid?).to be_falsey
      end
    end
  end

  context "valid document" do
    context "format is valid" do
      it "regex" do
        company = CompanyCustomized.new(cnpj: "33.532.758/0001-20")
        expect(company.valid?).to be_truthy

        company = CompanyCustomized.new(cnpj: "57169463000107")
        expect(company.valid?).to be_truthy
      end

      it "accept a nil value" do
        company = Company.new(cnpj: nil)
        expect(company.valid?).to be_truthy
      end

      it "accept a '' value" do
        company = Company.new(cnpj: "")
        expect(company.valid?).to be_truthy
      end
    end
  end
end
