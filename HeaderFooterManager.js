class SpecialHeader extends HTMLElement
{
    ConnectedCallBack()
    {
        this.innerHTML = `
        <header class="header">
            <div class="grid">
                <nav class="nav">
                    <ul class="header__list">
                        <li class="header__item"><i class="fa-solid fa-graduation-cap"></i></li>
                        <li class="header__item">E-Learning project</li>
                    </ul>

                    <ul class="header__list">
                        <li class="header__item">
                            <a href="#" class="header__item header__item--link">News</a>
                        </li>
                        <li class="header__item">Login</li>
                        <li class="header__item">Register</li>
                    </ul>
                </nav>
            </div>
        </header>
        `;
    }
}

class SpecialFooter extends HTMLElement
{
    ConnectedCallBack()
    {
        this.innerHTML = `
        <footer class="footer">
            <div class="grid">
                <ul class="footer__info">
                    <li class="footer__items">Dự án OJT - Fall2024</li>
                    <li class="footer__items">
                        <i class="fa-brands fa-github"></i>
                        <a href="https://github.com">Github: </a>
                    </li>
                    <li class="footer__items">© Powered by group 3 QN24_CPL_JAVA_06</li>
                </ul>
            </div>
        </footer>
        `;
    }
}

customElements.define('special-header', SpecialHeader);
customElements.define('special-footer', SpecialFooter);

// không dùng trên liveserver được
// bảo mật kém
// nói chung là tệ, xem cho biết