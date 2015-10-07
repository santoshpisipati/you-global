﻿using System;
using System.Net;
using System.Web.UI;
using System.Xml;

namespace CommissionCalculator
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblconvrate.Text = Convert.ToString(string.Format("{0:0.0000}", ConvertGOOG(1, "AUD", "USD")));
        }

        public decimal ConvertGOOG(decimal amount, string fromCurrency, string toCurrency)
        {
            decimal rate = 0;
            WebClient web = new WebClient();
            string url = string.Format("https://currency-api.appspot.com/api/{0}/{1}.xml", fromCurrency.ToUpper(), toCurrency.ToUpper(), amount);
            XmlDocument objXmlDocument = new XmlDocument();
            objXmlDocument.Load(url);
            XmlNodeList objXmlNodeList = objXmlDocument.SelectNodes("/result/rate");
            foreach (XmlNode objXmlNode in objXmlNodeList)
            {
                if (!string.IsNullOrEmpty(objXmlNode.InnerText))
                    // GET rate
                    rate = Convert.ToDecimal(objXmlNode.InnerText);
            }
            return rate;
        }

        protected void txtbox1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //IF(B28>D6,
                //((B28-D6)*E7)
                //    +((D6-D5)*E6)
                //    +(D5*E5),
                //IF(B28>D5,
                //    ((B28-D5)*E6)
                //    +(D5*E5),B28*E5))
                if (Convert.ToDouble(removeUSd(txtbox1.Text)) > Convert.ToDouble(removeUSd(d6.Text)))
                {
                    b29.Text = Convert.ToString((((Convert.ToDouble(removeUSd(txtbox1.Text)) - Convert.ToDouble(removeUSd(d6.Text))) * TrimLastCharacter(e7.Text))
                        + ((Convert.ToDouble(removeUSd(d6.Text)) - Convert.ToDouble(removeUSd(d5.Text))) * TrimLastCharacter(e6.Text))
                        + (Convert.ToDouble(removeUSd(d5.Text)) * Convert.ToDouble(TrimLastCharacter(e5.Text)))));
                    b30.Text = Convert.ToString(Math.Round(((removeUSd(b29.Text) / removeUSd(txtbox1.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox1.Text)) > Convert.ToDouble(removeUSd(d5.Text)))
                    {
                        b29.Text = Convert.ToString(
                            (((Convert.ToDouble(removeUSd(txtbox1.Text)) - Convert.ToDouble(removeUSd(d5.Text))) * TrimLastCharacter(e6.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d5.Text)) * TrimLastCharacter(e5.Text)) / 100)
                            );
                    }
                    else
                    { b29.Text = Convert.ToString((Convert.ToDouble(removeUSd(txtbox1.Text)) * TrimLastCharacter(e5.Text)) / 100); }
                    b30.Text = Convert.ToString(Math.Round(((removeUSd(b29.Text) / removeUSd(txtbox1.Text)) * 100), 2)) + '%';
                }

                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txtbox2_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //=IF(C28>D6,
                //((C28-D6)*E7)
                //    +((D6-D5)*E6)
                //    +(D5*E5),
                //IF(C28>D5,
                //    ((C28-D5)*E6)
                //    +(D5*E5),C28*E5))
                if (Convert.ToDouble(removeUSd(txtbox2.Text)) > Convert.ToDouble(removeUSd(d6.Text)))
                {
                    c29.Text = Convert.ToString((((Convert.ToDouble(removeUSd(txtbox2.Text)) - Convert.ToDouble(removeUSd(d6.Text))) * TrimLastCharacter(e7.Text))
                        + ((Convert.ToDouble(removeUSd(d6.Text)) - Convert.ToDouble(removeUSd(d5.Text))) * TrimLastCharacter(e6.Text))
                        + (Convert.ToDouble(removeUSd(d5.Text)) * Convert.ToDouble(TrimLastCharacter(e5.Text)))));
                    c30.Text = Convert.ToString(Math.Round(((removeUSd(c29.Text) / removeUSd(txtbox2.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox2.Text)) > Convert.ToDouble(removeUSd(d5.Text)))
                    {
                        c29.Text = Convert.ToString(
                            (((Convert.ToDouble(removeUSd(txtbox2.Text)) - Convert.ToDouble(removeUSd(d5.Text))) * TrimLastCharacter(e6.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d5.Text)) * TrimLastCharacter(e5.Text)) / 100)
                            );
                    }
                    else
                    { c29.Text = Convert.ToString((Convert.ToDouble(removeUSd(txtbox2.Text)) * TrimLastCharacter(e5.Text)) / 100); }
                    c30.Text = Convert.ToString(Math.Round(((removeUSd(c29.Text) / removeUSd(txtbox2.Text)) * 100), 2)) + '%';
                }

                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txtbox3_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //IF(D28>D6,
                //((D28-D6)*E7)
                //    +((D6-D5)*E6)
                //    +(D5*E5)
                //,IF(D28>D5,
                //    ((D28-D5)*E6)+(D5*E5),D28*E5))
                //        +IF(AND(B28>D5,C28>D5,D28>D5)
                //        ,D5*E8,0)
                double value = 0;
                if (Convert.ToDouble(removeUSd(txtbox3.Text)) > Convert.ToDouble(removeUSd(d6.Text)))
                {
                    value = (((Convert.ToDouble(removeUSd(txtbox3.Text)) - Convert.ToDouble(removeUSd(d6.Text))) * TrimLastCharacter(e7.Text))
                        + ((Convert.ToDouble(removeUSd(d6.Text)) - Convert.ToDouble(removeUSd(d5.Text))) * TrimLastCharacter(e6.Text))
                        + (Convert.ToDouble(removeUSd(d5.Text)) * Convert.ToDouble(TrimLastCharacter(e5.Text))));
                    b30.Text = Convert.ToString(Math.Round(((removeUSd(b29.Text) / removeUSd(txtbox1.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox3.Text)) > Convert.ToDouble(removeUSd(d6.Text)))
                    {
                        value = (((Convert.ToDouble(removeUSd(txtbox3.Text)) - Convert.ToDouble(removeUSd(d5.Text))) * TrimLastCharacter(e6.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d5.Text)) * TrimLastCharacter(e5.Text)) / 100);
                    }
                    else
                    { value = (Convert.ToDouble(removeUSd(txtbox3.Text)) * TrimLastCharacter(e5.Text)) / 100; }
                }
                if (Convert.ToDouble(removeUSd(txtbox1.Text)) > Convert.ToDouble(removeUSd(d5.Text))
                    && (Convert.ToDouble(removeUSd(txtbox2.Text)) > Convert.ToDouble(removeUSd(d5.Text)))
                    && (Convert.ToDouble(removeUSd(txtbox3.Text)) > Convert.ToDouble(removeUSd(d5.Text))))

                { value += (Convert.ToDouble(removeUSd(d5.Text)) * TrimLastCharacter(e8.Text)) / 100; }
                else
                {
                    value += 0;
                }
                d29.Text = Convert.ToString(value);
                d30.Text = Convert.ToString(Math.Round(((removeUSd(d29.Text) / removeUSd(txtbox3.Text)) * 100), 2)) + '%';
                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex) { }
        }

        protected void txtbox4_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //=IF(E28>D6,
                //((E28-D6)*E7)
                //    +((D6-D5)*E6)
                //    +(D5*E5),
                //IF(E28>D5,
                //    ((E28-D5)*E6)+(D5*E5),E28*E5))
                //        +IF(AND(C28>D5,D28>D5,E28>D5)
                //        ,D5*E8,0)
                double value = 0;
                if (Convert.ToDouble(removeUSd(txtbox4.Text)) > Convert.ToDouble(removeUSd(d6.Text)))
                {
                    value = (((Convert.ToDouble(removeUSd(txtbox4.Text)) - Convert.ToDouble(removeUSd(d6.Text))) * TrimLastCharacter(e7.Text))
                        + ((Convert.ToDouble(removeUSd(d6.Text)) - Convert.ToDouble(removeUSd(d5.Text))) * TrimLastCharacter(e6.Text))
                        + (Convert.ToDouble(removeUSd(d5.Text)) * Convert.ToDouble(TrimLastCharacter(e5.Text))));
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox4.Text)) > Convert.ToDouble(removeUSd(d5.Text)))
                    {
                        value = (((Convert.ToDouble(removeUSd(txtbox4.Text)) - Convert.ToDouble(removeUSd(d5.Text))) * TrimLastCharacter(e6.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d5.Text)) * TrimLastCharacter(e5.Text)) / 100);
                    }
                    else
                    { value = (Convert.ToDouble(removeUSd(txtbox4.Text)) * TrimLastCharacter(e5.Text) / 100); }
                }
                if (Convert.ToDouble(removeUSd(txtbox2.Text)) > Convert.ToDouble(removeUSd(d5.Text))
                    && (Convert.ToDouble(removeUSd(txtbox3.Text)) > Convert.ToDouble(removeUSd(d5.Text)))
                    && (Convert.ToDouble(removeUSd(txtbox4.Text)) > Convert.ToDouble(removeUSd(d5.Text))))

                { value += (Convert.ToDouble(removeUSd(d5.Text)) * TrimLastCharacter(e8.Text)) / 100; }
                else
                {
                    value += 0;
                }
                e29.Text = Convert.ToString(value);
                e30.Text = Convert.ToString(Math.Round(((removeUSd(e29.Text) / removeUSd(txtbox4.Text)) * 100), 2)) + '%';
                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex) { }
        }

        protected void txtbox6_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //=IF(B35>D13,
                //((B35-D13)*E14)
                //    +((D13-D12)*E13)
                //    +(D12*E12),
                //IF(B35>D12,
                //    ((B35-D12)*E13)
                //    +(D12*E12),B35*E12))
                if (Convert.ToDouble(removeUSd(txtbox6.Text)) > Convert.ToDouble(removeUSd(d13.Text)))
                {
                    b36.Text = Convert.ToString((((Convert.ToDouble(removeUSd(txtbox6.Text)) - Convert.ToDouble(removeUSd(d13.Text))) * TrimLastCharacter(e14.Text))
                        + ((Convert.ToDouble(removeUSd(d13.Text)) - Convert.ToDouble(removeUSd(d12.Text))) * TrimLastCharacter(e13.Text))
                        + (Convert.ToDouble(removeUSd(d12.Text)) * Convert.ToDouble(TrimLastCharacter(e12.Text)))));
                    b37.Text = Convert.ToString(Math.Round(((removeUSd(b36.Text) / removeUSd(txtbox6.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox6.Text)) > Convert.ToDouble(removeUSd(d12.Text)))
                    {
                        b36.Text = Convert.ToString(
                            (((Convert.ToDouble(removeUSd(txtbox6.Text)) - Convert.ToDouble(removeUSd(d12.Text))) * TrimLastCharacter(e13.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d12.Text)) * TrimLastCharacter(e12.Text)) / 100));
                    }
                    else
                    { b36.Text = Convert.ToString((Convert.ToDouble(removeUSd(txtbox6.Text)) * TrimLastCharacter(e12.Text)) / 100); }
                    b37.Text = Convert.ToString(Math.Round(((removeUSd(b36.Text) / removeUSd(txtbox6.Text)) * 100), 2)) + '%';
                }

                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex) { }
        }

        protected void txtbox7_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //=IF(C35>D13,
                //((C35-D13)*E14)
                //    +((D13-D12)*E13)
                //    +(D12*E12),
                //IF(C35>D12,
                //((C35-D12)*E13)
                //    +(D12*E12),C35*E12))
                if (Convert.ToDouble(removeUSd(txtbox7.Text)) > Convert.ToDouble(removeUSd(d13.Text)))
                {
                    c36.Text = Convert.ToString((((Convert.ToDouble(removeUSd(txtbox7.Text)) - Convert.ToDouble(removeUSd(d13.Text))) * TrimLastCharacter(e14.Text))
                        + ((Convert.ToDouble(removeUSd(d13.Text)) - Convert.ToDouble(removeUSd(d12.Text))) * TrimLastCharacter(e13.Text))
                        + (Convert.ToDouble(removeUSd(d12.Text)) * Convert.ToDouble(TrimLastCharacter(e12.Text)))));
                    c37.Text = Convert.ToString(Math.Round(((removeUSd(c36.Text) / removeUSd(txtbox7.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox7.Text)) > Convert.ToDouble(removeUSd(d12.Text)))
                    {
                        c36.Text = Convert.ToString(
                            (((Convert.ToDouble(removeUSd(txtbox7.Text)) - Convert.ToDouble(removeUSd(d12.Text))) * TrimLastCharacter(e13.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d12.Text)) * TrimLastCharacter(e12.Text)) / 100));
                    }
                    else
                    { c36.Text = Convert.ToString((Convert.ToDouble(removeUSd(txtbox7.Text)) * TrimLastCharacter(e12.Text)) / 100); }
                    c37.Text = Convert.ToString(Math.Round(((removeUSd(c36.Text) / removeUSd(txtbox7.Text)) * 100), 2)) + '%';
                }

                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex) { }
        }

        protected void txtbox8_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //=IF(D35>D13,
                //((D35-D13)*E14)
                //    +((D13-D12)*E13)
                //    +(D12*E12),
                //IF(D35>D12,
                //    ((D35-D12)*E13)
                //    +(D12*E12),D35*E12))
                if (Convert.ToDouble(removeUSd(txtbox8.Text)) > Convert.ToDouble(removeUSd(d13.Text)))
                {
                    d36.Text = Convert.ToString((((Convert.ToDouble(removeUSd(txtbox8.Text)) - Convert.ToDouble(removeUSd(d13.Text))) * TrimLastCharacter(e14.Text)
                        + ((Convert.ToDouble(removeUSd(d13.Text)) - Convert.ToDouble(removeUSd(d12.Text))) * TrimLastCharacter(e13.Text))
                        + (Convert.ToDouble(removeUSd(d12.Text)) * Convert.ToDouble(TrimLastCharacter(e12.Text))))));
                    d37.Text = Convert.ToString(Math.Round(((removeUSd(d36.Text) / removeUSd(txtbox8.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox8.Text)) > Convert.ToDouble(removeUSd(d12.Text)))
                    {
                        d36.Text = Convert.ToString(
                            (((Convert.ToDouble(removeUSd(txtbox8.Text)) - Convert.ToDouble(removeUSd(d12.Text))) * TrimLastCharacter(e13.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d12.Text)) * TrimLastCharacter(e12.Text)) / 100));
                    }
                    else
                    { d36.Text = Convert.ToString((Convert.ToDouble(removeUSd(txtbox8.Text)) * TrimLastCharacter(e12.Text)) / 100); }
                    d37.Text = Convert.ToString(Math.Round(((removeUSd(d36.Text) / removeUSd(txtbox8.Text)) * 100), 2)) + '%';
                }

                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex) { }
        }

        protected void txtbox9_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //=IF(E35>D13,
                //((E35-D13)*E14)
                //    +((D13-D12)*E13)
                //    +(D12*E12),
                //IF(E35>D12,
                //    ((E35-D12)*E13)
                //    +(D12*E12),E35*E12))
                if (Convert.ToDouble(removeUSd(txtbox9.Text)) > Convert.ToDouble(removeUSd(d13.Text)))
                {
                    e36.Text = Convert.ToString((((Convert.ToDouble(removeUSd(txtbox9.Text)) - Convert.ToDouble(removeUSd(d13.Text))) * TrimLastCharacter(e14.Text))
                        + ((Convert.ToDouble(removeUSd(d13.Text)) - Convert.ToDouble(removeUSd(d12.Text))) * TrimLastCharacter(e13.Text))
                        + (Convert.ToDouble(removeUSd(d12.Text)) * Convert.ToDouble(TrimLastCharacter(e12.Text)))));
                    e37.Text = Convert.ToString(Math.Round(((removeUSd(e36.Text) / removeUSd(txtbox9.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox9.Text)) > Convert.ToDouble(removeUSd(d12.Text)))
                    {
                        e36.Text = Convert.ToString(
                            (((Convert.ToDouble(removeUSd(txtbox9.Text)) - Convert.ToDouble(removeUSd(d12.Text))) * TrimLastCharacter(e13.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d12.Text)) * TrimLastCharacter(e12.Text)) / 100));
                    }
                    else
                    { e36.Text = Convert.ToString((Convert.ToDouble(removeUSd(txtbox9.Text)) * TrimLastCharacter(e12.Text)) / 100); }
                    e37.Text = Convert.ToString(Math.Round(((removeUSd(e36.Text) / removeUSd(txtbox9.Text)) * 100), 2)) + '%';
                }

                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex) { }
        }

        protected void txtbox11_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //=IF(B42>D20,
                //((B42-D20)*E21)
                //    +((D20-D19)*E20)
                //    +(D19*E19),
                //IF(B42>D19,
                //    ((B42-D19)*E20)
                //    +(D19*E19),B42*E19))
                if (Convert.ToDouble(removeUSd(txtbox11.Text)) > Convert.ToDouble(removeUSd(d20.Text)))
                {
                    b43.Text = Convert.ToString((((Convert.ToDouble(removeUSd(txtbox11.Text)) - Convert.ToDouble(removeUSd(d20.Text))) * TrimLastCharacter(e21.Text))
                        + ((Convert.ToDouble(removeUSd(d20.Text)) - Convert.ToDouble(removeUSd(d19.Text))) * TrimLastCharacter(e20.Text))
                        + (Convert.ToDouble(removeUSd(d19.Text)) * Convert.ToDouble(TrimLastCharacter(e19.Text)))));
                    b44.Text = Convert.ToString(Math.Round(((removeUSd(b43.Text) / removeUSd(txtbox11.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox11.Text)) > Convert.ToDouble(removeUSd(d5.Text)))
                    {
                        b43.Text = Convert.ToString(
                            (((Convert.ToDouble(removeUSd(txtbox11.Text)) - Convert.ToDouble(removeUSd(d19.Text))) * TrimLastCharacter(e20.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d19.Text)) * TrimLastCharacter(e19.Text)) / 100));
                    }
                    else
                    { b43.Text = Convert.ToString((Convert.ToDouble(removeUSd(txtbox11.Text)) * TrimLastCharacter(e19.Text)) / 100); }
                    b44.Text = Convert.ToString(Math.Round(((removeUSd(b43.Text) / removeUSd(txtbox11.Text)) * 100), 2)) + '%';
                }

                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex) { }
        }

        protected void txtbox12_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //=IF(C42>D20,
                //((C42-D20)*E21)
                //    +((D20-D19)*E20)
                //    +(D19*E19),
                //IF(C42>D19,
                //    ((C42-D19)*E20)
                //    +(D19*E19),C42*E19))
                if (Convert.ToDouble(removeUSd(txtbox12.Text)) > Convert.ToDouble(removeUSd(d20.Text)))
                {
                    c43.Text = Convert.ToString((((Convert.ToDouble(removeUSd(txtbox12.Text)) - Convert.ToDouble(removeUSd(d20.Text))) * TrimLastCharacter(e21.Text))
                        + ((Convert.ToDouble(removeUSd(d20.Text)) - Convert.ToDouble(removeUSd(d19.Text))) * TrimLastCharacter(e20.Text))
                        + (Convert.ToDouble(removeUSd(d19.Text)) * Convert.ToDouble(TrimLastCharacter(e19.Text)))));
                    c44.Text = Convert.ToString(Math.Round(((removeUSd(c43.Text) / removeUSd(txtbox12.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox12.Text)) > Convert.ToDouble(removeUSd(d19.Text)))
                    {
                        c43.Text = Convert.ToString(
                            (((Convert.ToDouble(removeUSd(txtbox12.Text)) - Convert.ToDouble(removeUSd(d19.Text))) * TrimLastCharacter(e20.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d19.Text)) * TrimLastCharacter(e19.Text)) / 100)
                            );
                    }
                    else
                    { c43.Text = Convert.ToString((Convert.ToDouble(removeUSd(txtbox12.Text)) * TrimLastCharacter(e19.Text)) / 100); }
                    c44.Text = Convert.ToString(Math.Round(((removeUSd(c43.Text) / removeUSd(txtbox12.Text)) * 100), 2)) + '%';
                }

                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex) { }
        }

        protected void txtbox13_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //=IF(D42>D20,
                //((D42-D20)*E21)
                //+((D20-D19)*E20)
                //    +(D19*E19),
                //IF(D42>D19,
                //    ((D42-D19)*E20)
                //    +(D19*E19),D42*E19))
                if (Convert.ToDouble(removeUSd(txtbox13.Text)) > Convert.ToDouble(removeUSd(d20.Text)))
                {
                    d43.Text = Convert.ToString((((Convert.ToDouble(removeUSd(txtbox13.Text)) - Convert.ToDouble(removeUSd(d20.Text))) * TrimLastCharacter(e21.Text))
                        + ((Convert.ToDouble(removeUSd(d20.Text)) - Convert.ToDouble(removeUSd(d19.Text))) * TrimLastCharacter(e20.Text))
                        + (Convert.ToDouble(removeUSd(d19.Text)) * Convert.ToDouble(TrimLastCharacter(e19.Text)))));
                    d44.Text = Convert.ToString(Math.Round(((removeUSd(d43.Text) / removeUSd(txtbox13.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox13.Text)) > Convert.ToDouble(removeUSd(d19.Text)))
                    {
                        d43.Text = Convert.ToString(
                            (((Convert.ToDouble(removeUSd(txtbox13.Text)) - Convert.ToDouble(removeUSd(d19.Text))) * TrimLastCharacter(e20.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d19.Text)) * TrimLastCharacter(e19.Text)) / 100)
                            );
                    }
                    else
                    { d43.Text = Convert.ToString((Convert.ToDouble(removeUSd(txtbox13.Text)) * TrimLastCharacter(e19.Text)) / 100); }
                    d44.Text = Convert.ToString(Math.Round(((removeUSd(d43.Text) / removeUSd(txtbox13.Text)) * 100), 2)) + '%';
                }

                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex) { }
        }

        protected void txtbox14_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //=IF(E42>D20,
                //((E42-D20)*E21)
                //    +((D20-D19)*E20)
                //    +(D19*E19),
                //IF(E42>D19,
                //    ((E42-D19)*E20)
                //    +(D19*E19),E42*E19))
                if (Convert.ToDouble(removeUSd(txtbox14.Text)) > Convert.ToDouble(removeUSd(d20.Text)))
                {
                    e43.Text = Convert.ToString((((Convert.ToDouble(removeUSd(txtbox14.Text)) - Convert.ToDouble(removeUSd(d20.Text))) * TrimLastCharacter(e21.Text))
                        + ((Convert.ToDouble(removeUSd(d20.Text)) - Convert.ToDouble(removeUSd(d19.Text))) * TrimLastCharacter(e20.Text))
                        + (Convert.ToDouble(removeUSd(d19.Text)) * Convert.ToDouble(TrimLastCharacter(e19.Text)))));
                    e44.Text = Convert.ToString(Math.Round(((removeUSd(e43.Text) / removeUSd(txtbox14.Text))), 2)) + '%';
                }
                else
                {
                    if (Convert.ToDouble(removeUSd(txtbox14.Text)) > Convert.ToDouble(removeUSd(d19.Text)))
                    {
                        e43.Text = Convert.ToString(
                            (((Convert.ToDouble(removeUSd(txtbox14.Text)) - Convert.ToDouble(removeUSd(d19.Text))) * TrimLastCharacter(e20.Text)) / 100)
                            + ((Convert.ToDouble(removeUSd(d19.Text)) * TrimLastCharacter(e19.Text)) / 100)
                            );
                    }
                    else
                    { e43.Text = Convert.ToString((Convert.ToDouble(removeUSd(txtbox14.Text)) * TrimLastCharacter(e19.Text)) / 100); }
                    e44.Text = Convert.ToString(Math.Round(((removeUSd(e43.Text) / removeUSd(txtbox14.Text)) * 100), 2)) + '%';
                }

                add500Values();
                add750Values();
                add1500Values();
            }
            catch (Exception ex) { }
        }

        private void add500Values()
        {
            try
            {
                f28.Text = Convert.ToString(Math.Round(removeUSd(txtbox1.Text) + removeUSd(txtbox2.Text) + removeUSd(txtbox3.Text) + removeUSd(txtbox4.Text)));
                f29.Text = Convert.ToString(Math.Round(removeUSd(b29.Text) + removeUSd(c29.Text) + removeUSd(d29.Text) + removeUSd(e29.Text)));
                double value = Math.Round(TrimLastCharacter(b30.Text) + TrimLastCharacter(c30.Text) + TrimLastCharacter(d30.Text) + TrimLastCharacter(e30.Text));
                double multvalue = value / 4;
                f30.Text = Convert.ToString(multvalue) + '%';
            }
            catch (Exception ex) { }
        }

        private void add750Values()
        {
            try
            {
                f35.Text = Convert.ToString(Math.Round(removeUSd(txtbox6.Text) + removeUSd(txtbox7.Text) + removeUSd(txtbox8.Text) + removeUSd(txtbox9.Text), 2));
                f36.Text = Convert.ToString(Math.Round(removeUSd(b36.Text) + removeUSd(c36.Text) + removeUSd(d36.Text) + removeUSd(e36.Text), 2));
                double value = Math.Round(TrimLastCharacter(b37.Text) + TrimLastCharacter(c37.Text) + TrimLastCharacter(d37.Text) + TrimLastCharacter(e37.Text), 2);
                double multvalue = value / 4;
                f37.Text = Convert.ToString(multvalue) + '%';
            }
            catch (Exception ex) { }
        }

        private void add1500Values()
        {
            try
            {
                f42.Text = Convert.ToString(Math.Round(removeUSd(txtbox11.Text) + removeUSd(txtbox12.Text) + removeUSd(txtbox13.Text) + removeUSd(txtbox14.Text)));
                f43.Text = Convert.ToString(Math.Round(removeUSd(b43.Text) + removeUSd(c43.Text) + removeUSd(d43.Text) + removeUSd(e43.Text)));
                double value = Math.Round(TrimLastCharacter(b44.Text) + TrimLastCharacter(c44.Text) + TrimLastCharacter(d44.Text) + TrimLastCharacter(e44.Text));
                double multvalue = value / 4;
                f44.Text = Convert.ToString(multvalue) + '%';
            }
            catch (Exception ex) { }
        }

        private double removeUSd(string value)
        {
            if (!string.IsNullOrEmpty(value))
            {
                if (!IsDigitsOnly(value))
                {
                    return Math.Round(Convert.ToDouble(value.Substring(3, value.Length - 3)), 2);
                }
                return Math.Round(Convert.ToDouble(value.Trim()), 2); ;
            }
            return 0;
        }

        private bool IsDigitsOnly(string str)
        {
            foreach (char c in str)
            {
                if ((c < '0' || c > '9') && c != '.' && c != ',')
                    return false;
            }
            return true;
        }

        public double TrimLastCharacter(string str)
        {
            if (String.IsNullOrEmpty(str))
            {
                return 0;
            }
            else if (str.Contains("%"))
            {
                return Convert.ToDouble(str.TrimEnd(str[str.Length - 1]));
            }
            else
            {
                return 0;
            }
        }
    }
}